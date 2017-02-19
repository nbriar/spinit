source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

gem 'puma', '~> 3.0' # For the app server

gem 'jsonapi-serializers' # For json serialization
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'#

# Database ORMs
gem 'pg' # For Active Record models
gem 'neo4j-core' # For most other models

# Authnentication and authorization
gem 'bcrypt', '~> 3.1.7' # For ActiveModel has_secure_password
gem 'knock' # For auth with jwts
gem 'authority', '~> 3.3' # For authorization

#Documentation
gem 'swagger-docs'

group :development, :test do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
