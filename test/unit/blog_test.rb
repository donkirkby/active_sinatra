require_relative '../test_helper'

class BlogTest < ActiveSupport::TestCase
  fixtures :blogs
  
  def test_create
    blog = Blog.create(:name => "Rob's Writing")
    assert_equal "Rob's Writing", blog.name
  end
  
  def test_find
    blog = Blog.find_by_name("Jimmy's Jottings")
    assert_equal "Stuff Jimmy says", blog.tagline
  end
end
