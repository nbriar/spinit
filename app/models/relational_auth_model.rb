class RelationalAuthModel < ActiveRecord::Base
  self.abstract_class = true
  include EnsureGuid
end
