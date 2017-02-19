class AccountTokenController < Knock::AuthTokenController
  # This controller is used to authenticate the user and returns a jwt in the response body
  # swagger_controller :account_token, 'AccountToken'
  #
  # swagger_api :create do
  #  summary 'Returns a jwt upon authentication '
  #  notes 'This is the authentication endpoint that accepts username and password.'
  #  param :form, "auth[username]", :string, :required, "Username"
  #  param :form, "auth[password]", :string, :required, "Username"
  # end

  def create
    jwt = auth_token
    response.headers["X-Authentication-Jwt"] = jwt.token
    render json: jwt, status: :created
  end
end
