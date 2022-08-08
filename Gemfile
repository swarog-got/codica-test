# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "bootstrap"
gem "bootstrap-icons-helper"
gem "cancancan"
gem "devise"
gem "enumerize"
gem "image_processing", "~> 1.2"
gem "importmap-rails"
gem "jbuilder"
gem "jquery-rails"
gem "pagy"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "ransack"
gem "redis", "~> 4.0"
gem "rolify"
gem "sassc-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end
