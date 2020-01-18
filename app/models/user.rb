class User < ActiveRecord::Base
    has_many :rsvps
    has_many :events, through: :rsvps
    has_secure_password

    def self.event_ids
        event_user = RSVP.find_each do |t,i|
            t[i].user_id=@user.id
        end
        binding.pry
    end
    def self.events_made(x)
        Event.all.find_each(id: x)
    end
end
