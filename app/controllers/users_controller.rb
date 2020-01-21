require 'pry'
class UsersController < ApplicationController

  get "/sign_up" do
    @sign_up_error = session[:sign_up_error]
    erb :"/users/new.html"    
  end
  post '/sign_up' do
    if User.find_by(email: params[:user][:email])
      session[:sign_up_error]="Someone already exist with email"
      redirect "/sign_up"
    elsif params[:user][:name].empty? && params[:user][:email].empty? && params[:user][:password].empty?
      session[:sign_up_error]="Inputs can't be empty"
      redirect "/sign_up"
    else
      @user=User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end

  end
  get '/login' do 
    @login_error = session[:login_error]
    erb :'/users/login'
  end
  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:login_error] = nil
      redirect "/users/#{@user.id}" 
    else 
      session[:login_error] = "Wrong Password"
      redirect "/login"
    end
  end
  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    @user=User.find_by(id: session[:user_id]) 
   
    erb :"/users/show.html"
  end
  post "/users/:id" do
    @user=User.find_by(id: params[:id])
    erb :"/users/show.html"
  end
  patch "/users/:id" do
    user=User.find_by(id: params[:id])
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password] if params[:user][:password] != "" && params[:user][:password] != user.password
    user.save
    redirect "/users/#{user.id}"
  end
  get "/logout" do
  session.clear
  redirect "/"
  end
  delete "/users/events/:id/delete" do
    event=Event.find_by(id: params[:id])
    if !event 
      session[:delete_error]="The event has already been deleted"
      redirect "/events/#{params[:id]}/delete"
    else
    event.destroy
    redirect "/events/#{params[:id]}/delete"
    end
  end
  
  get "/users/events/:id" do
    erb :"/users/events"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find_by(id: params[:id])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    user = User.find_by(id: params[:id])
    user.destroy
    redirect "/"
  end
end