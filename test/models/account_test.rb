require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "account initialization generates a guid on the account" do
    account = create(:account)

    assert account.guid.present?
  end

  test "#self.from_token_request returns nil when not a valid username" do
    params = {
      params: {"auth" => {"username" => "fakeusername"}}
    }
    request = OpenStruct.new(params)
    assert_nil(Account.from_token_request(request))
  end

  test "#self.from_token_request returns a user when a valid username is sent" do
    account = create(:account)
    params = {
      params: {"auth" => {"username" => account.username}}
    }
    request = OpenStruct.new(params)
    returned_account = Account.from_token_request(request)

    assert_equal(account, returned_account)
  end

  test "#self.from_token_payload returns nil when no valid session" do
    account = create(:account)
    payload = {"sub" => account.guid}
    returned_account = Account.from_token_payload(payload)

    assert_nil(returned_account)
  end

  test "#self.from_token_payload returns account when valid session" do
    account = create(:account_with_session)
    payload = {"sub" => account.guid, "ses" => account.session.guid}
    returned_account = Account.from_token_payload(payload)

    assert_equal(account, returned_account)
  end

  test "#to_token_payload returns a valid payload" do
    account = create(:account_with_session)

    payload = account.to_token_payload

    assert_equal(account.guid, payload[:sub])
    assert_equal(account.session.guid, payload[:ses])
    assert(account.session.expires_at > Time.now)
  end

  test "the username must be unique" do
    create(:account)
    account = build(:account)
    refute account.save
  end

  test "the password must have a length of 8 characters" do
    account = build(:account, password: 'short')
    refute account.save  end
end
