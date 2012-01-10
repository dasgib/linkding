source 'https://rubygems.org'

gem 'rails', '3.2.0.rc2'
gem 'pg'
#gem 'silent-postgres', group: [:development, :test]
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails', group: :development
gem 'sass-rails',   '~> 3.2.0'
gem 'devise'
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.0'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'rspec', '~> 2.8.0'
  gem 'spork', '> 0.9.0.rc'
  gem 'cucumber'
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
end

gem 'rspec-rails', '~> 2.8.1', group: [:development, :test]

group :development do
  # Deployment
  gem 'capistrano'

  # Testing
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-spork'
  # gem 'libnotify' # For guard notifications on linux
  gem 'ruby_gntp' # For the growl network protocol
end
