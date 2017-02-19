class AccountsController < SecureBaseController
  skip_before_action :authenticate_account, :set_account_guid, :update_session, only: :create
  swagger_controller :account, 'Account'

  swagger_api :index do
   summary 'Lists all accounts in the system.'
   notes 'Lists all accounts in the system if the requesting user has access.'
  end

  def index
    render json: JSONAPI::Serializer.serialize(Account.all, is_collection: true)
  end

  swagger_api :create do
   summary 'Creates an account to access the system.'
   notes 'Username and password are both required to create an account.
   The username must be unique and the password must be no less than 8 characters'
   param :form, "account[username]", :string, :required, "Username"
   param :form, "account[password]", :string, :required, "Password"
  end

  def create
    account = Account.new(account_params)
    if account.save
      res = JSONAPI::Serializer.serialize(account)
      jwt = account.update_session
      response.headers["X-Authentication-Jwt"] = jwt

      render json: res, status: 200
    else
      render json: JSONAPI::Serializer.serialize_errors(account.errors), status: 400
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
