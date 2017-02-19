module EnsureGuid
  extend ActiveSupport::Concern

  included do
    after_initialize :ensure_guid
  end

  def ensure_guid
    self.guid = "#{SecureRandom.uuid}" if guid.nil?
  end
end
