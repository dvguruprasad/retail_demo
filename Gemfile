source 'http://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl'
end

if ENV['RAILS_ENV'] == "test"
  gem 'spree_analytics', :git => "git@github.com:dvguruprasad/spree_analytics.git"
else
  gem 'spree_analytics', :path => "../spree_analytics"
end

gem 'jquery-rails'
gem 'spree', '1.2.0'
gem 'spree_usa_epay'
gem 'spree_skrill'
gem 'capistrano'

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
