source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use postgres as the database for Active Record
gem 'pg'

# Use Figaro to load ENV variables for given environment
gem 'figaro', '1.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# jquery ui for datepicker widget
gem 'jquery-ui-sass-rails'

# Use Foundation for styling, grid system, basic js
gem 'foundation-rails'

# Use NavLYNX to set class on link to current page
gem 'nav_lynx'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Paperclip to manage file attachments.  Read more: https://github.com/thoughtbot/paperclip
gem "paperclip", "~> 4.1"

# Direct upload form helper and assets
gem 's3_direct_upload' 

# Use Amazon Web Services S3 storage for file attachments
gem 'aws-sdk'

# Use Devise for Admin and User authentication
gem 'devise', '~> 3.4.0'

# Create demo users
gem 'faker'

# To stop crazy long-running processes
gem "rack-timeout"

# Intercept emails in staging environment
gem 'recipient_interceptor'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Setup for Capistrano deployment on Digital Ocean
# gem 'capistrano', '~> 3.1.0'
# gem 'capistrano-bundler', '~> 1.1.2'
# gem 'capistrano-rails', '~> 1.1.1'
# gem 'capistrano-rbenv', github: "capistrano/rbenv"

# Setup staging and production gems
group :production, :staging do
  gem 'puma'
  gem 'rails_12factor' # To compile assets on Heroku
# gem 'therubyracer',  platforms: :ruby   ONLY NEEDED ON LINUX BOX
end

# Setup development and test gems
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'capybara', '~> 2.4.3'  # To simulate user interaction with browser
  gem 'capybara-webkit'  # For pages with JavaScript - so they load in real webpage
  gem 'database_cleaner'  # To clean database after capybara-webkit messes it up
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'launchy'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :development do
  gem "letter_opener"
  gem 'bullet'
end

group :test do
  gem 'shoulda-matchers', require: false
end