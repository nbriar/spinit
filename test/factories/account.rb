require 'faker'

FactoryGirl.define do
  factory :account do
    username { Faker::Internet.email }
    password "password"


    factory :account_with_session do
      after(:create) do |account|
        Session.create(account: account, expires_at: 10.minutes.from_now)
      end
    end
  end
end
