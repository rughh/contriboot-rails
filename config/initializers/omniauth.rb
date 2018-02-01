Rails.application.config.middleware.use OmniAuth::Builder do
  puts "#{Rails.application.secrets.inspect}"
  provider :github, Rails.application.secrets.github_provider_key, Rails.application.secrets.github_provider_secret, scope: 'read:user'
end
