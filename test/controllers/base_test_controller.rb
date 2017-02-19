class BaseTestController < ActionDispatch::IntegrationTest
  def authenticated_header
    account = create(:account_with_session)
    token = account.update_session

    {
      'Authorization': "Bearer #{token}"
    }
  end
end
