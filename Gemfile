source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'


# App and System gems
gem 'rails', '~> 5.2.1'                     # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg', '>= 0.18', '< 2.0'                # Use postgresql as the database for Active Record
# gem 'redis', '~> 4.0'                       # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.11'                   # Use ActiveModel has_secure_password
gem 'unicorn'                               # Web Server used in docker
gem 'bootsnap', '>= 1.1.0', require: false  # Reduces boot times through caching; required in config/boot.rb
# gem "attr_encrypted", "~> 3.0.0"            # Encrypt fields in the DB https://github.com/attr-encrypted/attr_encrypted
# gem 'aws-sdk', '~> 3'                       # AWS SDK gem https://aws.amazon.com/sdk-for-ruby/
# gem "cocoon"                                # NEsted Forms
# gem 'paper_trail'                           # For versioning of model
# gem 'validate_url'                          # validates that url is valid
gem 'cookies_eu'                      # Adds cookie constent banner
# gem 'date_validator'                        # A simple date validator for Rails


# Styles and JS gems
gem 'sass-rails', '~> 5.0'                  # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                  # Use Uglifier as compressor for JavaScript assets
# gem 'mini_racer', platforms: :ruby          # See https://github.com/rails/execjs#readme for more supported runtimes
gem 'jbuilder', '~> 2.5'                    # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'turbolinks', '~> 5'                    # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'bootstrap', '~> 4.0.0'
# gem 'jquery-rails'
# gem 'jquery-migrate-rails'
# gem 'will_paginate',           '3.1.5'
# gem 'bootstrap-will_paginate', '1.0.0'
# gem 'jquery-easing-rails'
# gem 'bootstrap_form'                          # Allow creating form_for easier with bootstrap
# gem 'chosen-rails'                            # Allows searching through text field
# gem "wysiwyg-rails"                           # Turns Text area into rich text editor
# gem 'toastr-rails'                    # Javascript library for Gnome / Growl type non-blocking notifications


# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'           # Image Processor
gem 'carrierwave', '~> 1.0'           # Image Uploading

#Auth System
gem 'devise'                          # User Auth System
gem 'devise-security'                 # Devise add-on
gem 'rails_email_validator'           # required by devise_security
# gem 'pundit'                          # Auth Tools
# gem 'rails_admin', '~> 1.3'           # Rails admin system
# gem 'cancancan', '~> 2.0'             # CanCanCan is an authorization library
# gem 'easy_captcha'                    # captcha for signup, may require brew install imagemagick@6 && brew link imagemagick@6 --force
# gem 'omniauth-bitbucket'              # Oauth Gem




group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]     # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "rspec-rails"
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard', '~> 1.6.1'
  gem "factory_bot_rails"
end

group :development do
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'               # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'           # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rails_real_favicon'                   # Creates rails supported favicon
  gem 'rails-erd'                            # creates database diagrams
  gem "lol_dba"                              # Find missing indexs
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'          # Adds support for Capybara system testing and selenium driver
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'                    # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  gem 'simplecov', :require => false
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'database_cleaner', '~> 1.5'
  gem 'faker'
  gem 'pry-byebug'
end
