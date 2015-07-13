source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'puma', '~> 2.11.3' # Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server

#=== Database ==============================
gem 'pg', '~> 0.18.2'

#=== Misc ==================================
gem 'active_model_serializers', '~> 0.10.0.rc1'
gem 'responders', '~> 2.1.0' # A set of Rails responders to dry up your application
gem 'rails-api', '~> 0.4.0'

group :documentation do
  gem 'yard-rails', '~> 0.3.0'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'spring', '~> 1.3.6'
  gem 'foreman'
  gem 'dotenv-rails'
  gem 'ffaker'

end

group :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'terminal-notifier-guard', require: false
  gem 'libnotify', require: false
end
