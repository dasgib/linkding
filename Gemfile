source 'https://rubygems.org'

gem 'rails', '~> 3.2.9'
gem 'pg'
#gem 'silent-postgres', group: [:development, :test]
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails', group: :development
gem 'sass-rails', '~> 3.2.0'
gem 'devise'
gem 'simple_form', '~> 2.0.4'
gem 'acts-as-taggable-on'
gem 'foreigner'
gem 'inherited_resources'
gem 'has_scope'
gem 'will_paginate', '~> 3.0'
gem 'nokogiri'
gem 'activerecord-postgres-array'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.0'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass'
  gem 'compass-rails'
  gem 'compass-lucid-grid', require: 'lucid'
  gem 'jquery-ui-rails'
  gem 'turbo-sprockets-rails3'
end

group :test do
  gem 'rspec', '~> 2.12.0'
  gem 'spork', '> 0.9.0.rc'
  gem 'cucumber'
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'capybara', '~> 2.0.0'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'launchy'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.12.0'
  gem 'factory_girl_rails', '~> 4.1.0'
end

group :development do
  # Deployment
  gem 'capistrano'

  gem 'thin'
end
