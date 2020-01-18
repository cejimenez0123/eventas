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
    @user = User.find_by(name: params[:user][:name],email: params[:user][:email], password_digest: params[:user][:password_digest])
    redirect "/users/#{@user.id}"
  end
  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    @user=User.find_by(id: params[:id])
    erb :"/users/show.html"
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


  # get "/user" do
  #     @user = params[:user]
  # end
  # get '/user/sign_up' do
  #     erb :'/user/new'
  #   end
  # get "/user/login" do
  #     erb :'/user/show'
  #   end
  #   get "/user/:id" do
  #     erb :'/user'
  #   end
  
  
  # end