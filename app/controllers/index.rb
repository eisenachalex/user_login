enable :sessions

get '/' do
    if session[:valid_user]
      erb :welcome
    else
      erb :index
    end
end

post '/login' do
@username = params[:username]
@password = params[:password]
@valid_user =  User.find_by_username(@username) 

if @valid_user == nil 
  erb :failed_login
elsif @valid_user.password != @password
  erb :failed_login
else
  session[:valid_user] = params[:username]
  redirect to("/")
end

end

get '/create' do
  
  erb :create
end

post '/create' do
  p "THIS IS THE CODE:#{params[:post][:username]}"
  @user = User.create(params[:post])
  session[:valid_user] = params[:post][:username]
  redirect to("/")
end

get '/logout' do
  session[:valid_user] = nil
  erb :index

end
