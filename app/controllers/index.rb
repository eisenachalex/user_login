enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
@username = params[:username]
@password = params[:password]
erb :process_login

end














get '/:value' do
  session[:value] = params[:value]
end
