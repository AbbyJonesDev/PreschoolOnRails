source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

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

# Use Foundation for styling, grid system, basic js
gem 'foundation-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Paperclip to manage file attachments.  Read more: https://github.com/thoughtbot/paperclip
gem "paperclip", "~> 4.1"

# Use Amazon Web Services S3 storage for file attachments
gem 'aws-sdk'

# Use Devise for Admin and User authentication
gem 'devise'

# Create demo users
gem 'faker'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use unicorn as the app server
gem 'unicorn'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'capybara', '~> 2.4.3'  # To simulate user interaction with browser
  gem 'capybara-webkit'  # For pages with JavaScript - so they load in real webpage
  gem 'database_cleaner'  # To clean database after capybara-webkit messes it up
  gem 'debugger'
  gem 'launchy'
end

group :test do
  gem 'shoulda-matchers', require: false
end

gem 'rails_12factor', group: :production # To make app work on Heroku

# Use Capistrano for deployment
# gem 'capistrano', group: :development