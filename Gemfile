source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'devise', '2.1.2'

gem 'thin', '1.5.0' #instead of webrick. removes http errors from log

#gem 'twitter-bootstrap-rails', '2.2.6'
gem 'bootstrap-sass', '2.3.1.0'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'better_errors', '0.3.2'
  gem 'sqlite3', '1.3.6'
  gem "binding_of_caller" #used by better errors
  gem "annotate"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem 'twitter-bootstrap-rails', '2.2.6'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.0.3'

  gem 'therubyracer', '0.11.4'
  gem 'less-rails', '2.3.2'

end

gem 'jquery-rails', '2.1.4'



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

group :production do
  gem 'pg', '0.14.1'
  gem 'exception_notification', '2.6.1' #exception notifier in production
end