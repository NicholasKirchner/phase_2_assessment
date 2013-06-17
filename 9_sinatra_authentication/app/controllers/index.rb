get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    @error = "Sign-in failed!"
    @email = params[:email]
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  redirect "/"
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect "/"
end
