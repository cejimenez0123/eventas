class User < ActiveRecord::Base
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :created_events, class_name: "events", foreign_key: "user_id"
  has_secure_password
end
