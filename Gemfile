source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'faker'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use PG as the database for Active Record
gem 'pg'
# Use Devise for authentication
gem 'devise'
# Handle user names
gem 'name_of_person'
# Authorization
gem 'cancancan', '~> 2.0'
# Use Geocoder to retrieve lat and long addresses
gem 'geocoder'
# Use Trix Rich Text Editor
gem 'trix-rails', require: 'trix'
# Use PG_Search to do simple searches
gem 'pg_search', '~> 2.2'
# Group data to serve dashboard
gem 'groupdate'
# Displays charts for dashboards
gem 'chartkick'
# Generates QR Codes
gem 'rqrcode'
# Pagination
gem 'kaminari'
# Gera PDF
gem 'prawn', '~> 2.2', '>= 2.2.2'
# Importa qrcode no PDF
gem 'prawn-qrcode'
# Importa SVG no PDF
gem 'prawn-svg'
# Possibilita uso de tables no PDF
gem 'prawn-table'
# Habilita Sidekiq
gem 'sidekiq'
# Split
gem 'split', require: 'split/dashboard'
# Mobile views
gem 'browser'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'
# Use image_processing to create imgs variants
gem 'image_processing', '~> 1.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Wirecard
gem "moip2"

# Money rails
gem 'money-rails', '~>1.12'

# Webpacker
gem 'webpacker', '~> 4.x'

# Fast JSON API
gem 'fast_jsonapi'

# ActiveRecordUnion
gem 'active_record_union'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Seed Dump
  gem 'seed_dump'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rb-readline'
  gem 'ngrok-tunnel'
  gem 'tty-box'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
