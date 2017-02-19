class SecureBaseController < ApplicationController
  include Knock::Authenticable
  attr_accessor :account_guid
  # authenticate_account is provided by the knock gem
  before_action :authenticate_account, :set_account_guid, :update_session

  private
  # This is just a helper method because I'm lazy
  # it allows us to use account_guid in any controller that inherits from here
  def set_account_guid
    @account_guid = current_account.guid
  end

  def update_session
    if current_account.session.present?
      token = current_account.update_session
      response.headers["X-Authentication-Jwt"] = token
    end
  end
end
