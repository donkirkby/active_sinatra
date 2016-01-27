get '/blogs/:blog_id/posts' do
  blog = Blog.find_by_id(params[:blog_id])
  @posts = blog.posts
  @posts.to_json
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  @post.to_json
end
