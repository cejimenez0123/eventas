require 'pry'
class EventsController < ApplicationController

  # GET: /events
  get "/events" do
    erb :"/events/index.html"
  end

  # GET: /events/new
  get "/events/new" do
    @event_error=session[:event_error]
    erb :"/events/new.html"
  end
  post "/events/new" do
    if Event.find_by(name: params[:event][:name])
      session[:event_error]="An event exist with name already"
      redirect "/events/new"
    elsif params[:event][:name].empty? && params[:event][:dis].empty?
      session[:event_error]="Inputs can't be empty"
      redirect "/events/new"
    else
      @event = Event.create(name: params[:event][:name],dis: params[:event][:dis], user: current_user)
      @event.user = current_user
      redirect "/events"
    end
  end
  post "/events/:id/rsvp" do
    event = Event.find_by(id: params[:id])
    Rsvp.create(event: event, user: current_user)
    redirect "/events/my_rsvps"
  end
  get "/events/my_rsvps" do 
    @user=User.find_by(id: session[:user_id])
    erb :"/rsvp/index"
  end
  delete "/events/:id/rsvp/delete" do
    event = Event.find_by(id: params[:id])
    rsvp = Rsvp.find_by(event: event, user: current_user) 
    rsvp.destroy
    redirect "/events/my_rsvps"
  end
  get "/events/delete" do
    erb :'/events/delete'
  end

  # GET: /events/5
  get "/events/:id" do
    @event = Event.find_by(id: params[:id])
    @rsvp = Rsvp.find_by(user: current_user, event: @event)
    erb :"/events/show.html"
  end

  get "/events/welcome" do
    erb :"/events/cu"
  end

  # GET: /events/5/edit
  get "/events/:id/edit" do
    @delete_error = session[:delete_error]
    @event = Event.find_by(id: params[:id])
    erb :"/events/edit.html"
  end

  # PATCH: /events/5
  patch "/events/:id" do
    event = Event.find_by(id: params[:id])
    event.name = params[:event][:name]
    event.dis = params[:event][:dis]
    event.save
    redirect "/events/#{event.id}"
  end

  # DELETE: /events/5/delete
  delete "/events/:id/delete" do
    redirect "/events"
  end



  helpers do 
    def current_user
      User.find_by(id: session[:user_id])
    end
  end





end
