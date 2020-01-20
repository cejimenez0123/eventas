require 'pry'
class EventsController < ApplicationController

  # GET: /events
  get "/events" do
    erb :"/events/index.html"
  end

  # GET: /events/new
  get "/events/new" do
    erb :"/events/new.html"
  end
  post "/events/new" do
    @event = Event.create(name: params[:event][:name],dis: params[:event][:dis],user_id: current_user.id)
    redirect "/events"
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
    
    erb :"/events/show.html"
  end
  post "/events/:id" do
    # @event = Event.find_by(id:)
    # erb :"/events/show.html"
    
  end
  get "/events/welcome" do
    erb :"/events/cu"
  end

  # GET: /events/5/edit
  get "/events/:id/edit" do
    @event = Event.find_by(id: params[:id])
    erb :"/events/edit.html"
  end

  # PATCH: /events/5
  patch "/events/:id" do
    binding.pry
    session[:event_id]=@event.id
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
