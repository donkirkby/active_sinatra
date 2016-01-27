require_relative '../test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :blogs, :posts
  
  def test_create
    post = Post.create(
      :headline => "Jimmy says hey",
      :body_text => "Hey!",
      :blog => blogs(:jimmy))
    assert_equal "Hey!", post.body_text
    assert_equal "Jimmy's Jottings", post.blog.name
  end
  
  def test_find
    post = Post.find_by_headline("Party Time")
    assert_equal "Come to my house.", post.body_text
  end
end
