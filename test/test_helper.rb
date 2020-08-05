require_relative '../app'
require 'minitest/autorun'
require 'active_record'

ActiveRecord::Base.establish_connection(:test)

#Set up fixtures and such
class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  include ActiveRecord::TestFixtures::ClassMethods
  
  self.fixture_path = 'test/fixtures'
  self.use_instantiated_fixtures  = false
end
