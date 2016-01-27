require_relative '../app'
require 'minitest/autorun'
require 'active_record'

ActiveRecord::Base.establish_connection(:test)

#Set up fixtures and such
class ActiveSupport::TestCase
  include ActiveRecord::TestFixtures
  include ActiveRecord::TestFixtures::ClassMethods
  
  class << self
    def fixtures(*fixture_set_names)
      self.fixture_path = 'test/fixtures'
      super *fixture_set_names
    end
  end

  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
