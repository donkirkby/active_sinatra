get '/blogs' do
  @blogs = Blog.all
  @blogs.to_json
end

get '/blogs/:id' do
  @blog = Blog.find_by_id(params[:id])
  @blog.to_json
end
