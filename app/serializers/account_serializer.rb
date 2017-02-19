class AccountSerializer < BaseSerializer
  include JSONAPI::Serializer

  attribute :username
  attribute :created_at
  attribute :updated_at
  
end
