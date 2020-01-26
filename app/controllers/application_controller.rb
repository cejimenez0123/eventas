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
  helpers do 
    def current_user
      current_user=User.find_by(id: session[:user_id])
      current_user
    end
  end
  

end
