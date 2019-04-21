require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  setup do
    OmniAuth.config.test_mode = true
  end

  def login_as(fixture_name)
    user = users(fixture_name)
    OmniAuth.config.add_mock(:github, {:uid => user.uid})
    get '/auth/github'
    follow_redirect!

  end

end
