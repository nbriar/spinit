ENV['RAILS_ENV'] ||= 'test'
require "simplecov"

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "database_cleaner"
require "minitest/pride"
require "controllers/base_test_controller"
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

SimpleCov.start
