get '/' do
  @categories = Category.all
  erb :index
end

get '/new/category' do
  erb :new_category
end

post '/new/category' do
  Category.create(params[:category])

  redirect '/'
end

get '/category/:name' do
  category_name = params[:name]
  @category = Category.where("name = ?", category_name).first
  erb  :category
end
  
post '/new/post' do
  @post = Post.create(params[:post])

  #c = Category.find(params[:category_id])
  #c.posts << Post.create(params[:post])
  redirect "/category/#{@post.category.name}"
end

get '/:id/edit' do
  @post = Post.find(params[:id])
  erb  :edit
end

post '/:id/edit' do
  
  @post.update_attributes(params[:post])
end
