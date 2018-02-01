Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets.github_provider_key, Rails.application.secrets.github_provider_secret, scope: 'read:user'
end
