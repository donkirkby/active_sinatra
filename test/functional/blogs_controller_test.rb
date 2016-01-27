require_relative '../test_helper'

class BlogsControllerTest < ActiveSupport::TestCase
  fixtures :blogs

  def test_should_get_index
    get '/blogs'
    assert last_response.ok?
    assert_equal "Dave's Diatribes", JSON.parse(last_response.body)[0]['name']
  end
end
