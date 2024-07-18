# Specify the source for gems
source "https://rubygems.org"

# Specify the Ruby version
ruby "3.3.1"

# Rails framework
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# Asset pipeline for Rails
gem "sprockets-rails"

# SQLite database adapter
gem "sqlite3", "~> 1.4"

# Puma web server
gem "puma", ">= 5.0"

# JavaScript with ESM import maps
gem "importmap-rails"

# Hotwire's SPA-like page accelerator
gem "turbo-rails"

# Hotwire's modest JavaScript framework
gem "stimulus-rails"

# JSON API builder
gem "jbuilder"

# Bootstrap CSS framework
gem 'bootstrap', '~> 5.1.3'

# jQuery JavaScript library
gem 'jquery-rails'

# Generate Entity-Relationship Diagrams
gem 'rails-erd'

# Timezone data for Windows
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Reduce boot times through caching
gem "bootsnap", require: false

# Development and test group
group :development, :test do
  # Debugging gem
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
  
  # RSpec testing framework
  gem 'rspec-rails', '~> 6.0'
  
  # Capybara for integration testing
  gem 'capybara', '~> 3.36'
  
  # Selenium WebDriver for browser automation
  gem 'selenium-webdriver', '~> 4.22.0'
  
  # Webdrivers for Selenium
  gem 'webdrivers', '~> 5.2.0'
  
  # Rails controller testing helpers
  gem 'rails-controller-testing'
end

# Development group
group :development do
  # Web console for debugging
  gem "web-console"
end

# Test group
group :test do
  # Factory Bot for test data generation
  gem 'factory_bot_rails'
  
  # Faker for generating fake data
  gem 'faker'
end