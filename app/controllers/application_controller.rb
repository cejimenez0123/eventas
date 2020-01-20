require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'sesh'
  end


  get '/' do 
    erb :'app/index'
  end
  
  

end