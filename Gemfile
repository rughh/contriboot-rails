source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.5'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 5.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'prawn-svg'
gem 'prawn-rails', '~> 1.0'
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 3.17'
  gem 'selenium-webdriver'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootstrap', '~> 4.3.1'
gem 'high_voltage'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-github'
gem 'pg', '~> 1.1'


group :development do
  gem 'better_errors'
  gem 'rails_layout'
end
