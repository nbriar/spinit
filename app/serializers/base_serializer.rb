class BaseSerializer
  include JSONAPI::Serializer

  # def base_url
  #   Rails.configuration.x.base_url
  # end

  def id
    object.guid
  end
end
