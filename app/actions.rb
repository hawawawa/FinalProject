require "sinatra/json"

helpers do
  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_movie
    @current_movie = Movie.find_by(id: session[:movie_id]) if session[:movie_id]
    # @movie = Movie.find(params[:id])
  end

  def has_favorited
    if current_user != nil
      !Favorite.find_by(user_id: current_user.id, movie_id: current_movie.id)
    end
  end

  def current_user_name
    if current_user
      current_user.username
    end
  end
end


###############################
#     Homepage (Root path)
###############################

get '/' do
  erb :main
end

get '/main' do
  erb :main
end

#####################
#     Login
#####################
get '/login' do
  erb :login
end

post '/login' do
  # binding.pry - debuging tool
  user = User.find_by(email: params[:email])

  if (user && user.password == params[:password])
    session[:user_id] = user.id
    redirect "/main"
  else 
    @error = "Login failed!!"
    redirect "/login"
  end
end

#####################
#     Register
#####################
get '/register' do
  erb :login
end

post '/register' do
  # binding.pry - debuging tool
  user = User.find_by(email: params[:email])

  if user
    @error = "Already registered!!"
    erb :login
  else
    # user = User.create(fname: params[:fname], lname params[:lname], email: params[:email], password: params[:password])
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/main"
  end
end

##############################
##     User profile page
##############################
get '/users/:id' do

  # @user = User.find(params[:id])
  # movie = Movie.find(params[:id])
  # params.inspect
  # @movie.to_json.inspect
  erb :users
end

post '/users/:id/edit' do
  user = User.find_by(id: current_user.id)
  user.update(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  redirect "/users/#{current_user.id}"
end

post '/favorites/remove' do
  @favorites = Favorite.where(user_id: current_user.id)

  @favorites.each do |favorite|
    favorite.destroy
  end

  redirect "/users/#{current_user.id}"
end  

post '/favorites/:id/remove' do
  @favorite = Favorite.find_by(user_id: current_user.id, id: params[:id])
  @favorite.destroy
  # redirect "/users/#{current_user.id}"
  json :status => 'success'

end

post '/reviews/remove' do
  @reviews = Review.where(user_id: current_user.id)
  @reviews.destroy
  redirect "/users/#{current_user.id}"
end

post '/reviews/:id/remove' do
  @review = Review.find_by(user_id: current_user.id, id: params[:id])
  @review.destroy
  redirect "/users/#{current_user.id}"
end


#####################
#     New Movie
#####################
get '/movies/new' do
  erb :"movies/new"
end

post '/movies/new' do
  # binding.pry #- debuging tool
  current_user.movies.create(
    name: params[:movie_name],
    director: params[:director_name],
    year: params[:release_year],
    poster_url: params[:poster_url]
  )
  redirect "/movies/new"
end

#####################
#     Search Movies
#####################
get '/movies/search' do
  @movies = Movie.where('name LIKE ?', "%" + params[:query] + "%").order(created_at: :desc)
  erb :"movies/search"
end

#####################
#     List Movies
#####################
get '/movies/list' do
  erb :"movies/list"
end


#####################
#     Movie page
#####################
get '/movies/:id' do

  @movie = Movie.find(params[:id])
  session[:movie_id] = @movie.id

  @has_favorited = has_favorited
  # movie = Movie.find(params[:id])
  # params.inspect
  # @movie.to_json.inspect
  erb :movies
end

#####################
#     new comment
#####################
post '/comments/new/' do
  # binding.pry - debuging tool
  Review.create(
    rating: params[:rating],
    comments: params[:comments],
    user_id: current_user.id,
    movie_id: current_movie.id
    )
  redirect "/movies/#{current_movie.id}"
end

#####################
#     add favorites
#####################
post '/favorites/add/' do
  # binding.pry - debuging tool
  fav = Favorite.find_by(user_id: current_user.id, movie_id: current_movie.id)
  
  if fav 
    fav.destroy
  else
    Favorite.create(
    user_id: current_user.id,
    movie_id: current_movie.id
    )    
  end

  redirect "/movies/#{current_movie.id}"
end

#####################
#     Logout
#####################
get '/users/:id/logout' do
  session[:user_id] = nil
  redirect "/main" 
end


