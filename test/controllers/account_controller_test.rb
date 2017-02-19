require 'test_helper'

class AccountsControllerTest < BaseTestController
  test "it should create an account" do
    params = {account: {username: "testing", password: "verytrying"}}
    post "/accounts", params: params

    assert_equal 200, response.status
  end

  test "it return an error for an account with invalid credentials" do
    params = {account: {username: "testing", password: "short"}}
    post "/accounts", params: params

    assert_equal 400, response.status
  end

  test "index should list accounts" do
    create_list(:account, 4)
    get "/accounts", headers: authenticated_header

    assert_equal 200, response.status
    assert_equal 5, JSON.parse(response.body)["data"].count
  end
end
