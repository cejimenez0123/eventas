class Event < ActiveRecord::Base
  has_many :rsvps
  belongs_to :user
  has_many :users, through: :rsvps
end