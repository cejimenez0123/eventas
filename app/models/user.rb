class User < ActiveRecord::Base
    has_many :rsvps
    has_many :events
    has_secure_password

end
