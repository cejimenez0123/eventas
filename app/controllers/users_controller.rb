require 'pry'
class UsersController < ApplicationController

  # GET: /users
  # get "/users" do
  #   erb :"/users/index.html"
  # end

  # GET: /users/new
  get "/sign_up" do
    erb :"/users/new.html"
    
  end
  post '/sign_up' do
    @user=User.create (params[:user])
      redirect "/users/#{@user.id}"
  end
  get '/login' do 
    erb :'/users/login'
  end
  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}" 
    else 
      redirect "/login"
    end
  end
  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    @user=User.find_by(params)
    erb :"/users/index.html"
  end
  post "/users/:id" do
    @user=User.find_by(params)
    erb :"/users/show.html"
  end
patch "/users/:id" do
  @user.find_by(params)
end
  

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

end