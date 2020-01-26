class Event < ActiveRecord::Base
  has_many :rsvps
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
  has_many :users, through: :rsvps
end