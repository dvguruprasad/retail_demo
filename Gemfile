source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem "coffee-rails", "~> 3.2.1"
end

gem "uglifier", ">= 1.0.3"
gem "therubyracer"

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl'
end

if ENV['RAILS_ENV'] != "test"
  gem 'spree_analytics', :path => "../spree_analytics"
else
  gem 'spree_analytics', :git => "git@github.com:dvguruprasad/spree_analytics.git"
end

#gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'spree', '1.2.0'
gem 'spree_usa_epay'
gem 'spree_skrill'
gem 'spree_auth_devise', :git => 'git://github.com/spree/spree_auth_devise'
gem 'capistrano'
gem 'capistrano-ext'
gem 'rvm-capistrano'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
