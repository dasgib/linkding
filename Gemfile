source 'https://rubygems.org'

gem 'rails', '3.2.0.rc1'
gem 'pg'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails', group: :development

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'

  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'rspec', git: "git://github.com/rspec/rspec.git"
  gem 'cucumber'
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'capybara'
  gem 'database_cleaner'
end

gem 'rspec-rails', git: "git://github.com/rspec/rspec-rails.git", group: [:development, :test]
