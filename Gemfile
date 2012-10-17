source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem "jquery-rails"
gem "rails_best_practices", "~> 1.11.1"
gem "flay"
gem "metric_fu"
group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails'
end
