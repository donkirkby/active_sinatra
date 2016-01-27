require_relative '../app'
require 'minitest/autorun'
require 'active_record'
require 'rack/test'

ActiveRecord::Base.establish_connection(:test)

#Set up fixtures and such
class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  include ActiveRecord::TestFixtures::ClassMethods
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  self.fixture_path = 'test/fixtures'
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
