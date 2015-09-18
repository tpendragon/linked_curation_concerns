source "https://rubygems.org"

ruby "2.2.3"

gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "rails", "~> 4.2.0"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem 'sqlite3'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "pry-byebug"
  gem "factory_girl_rails"
  gem "rspec-rails", "~> 3.3.0"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
