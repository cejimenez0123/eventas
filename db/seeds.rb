a = User.create(name: "bob", email: "bobby@hot.com", password: "bobo")
b = User.create(name: "emmy", email: "emmy@hot.com",password: "emem")
c = User.create(name: 'john', email: 'johnny@hot.com', password: 'jojo')
d = User.create(name: 'lan', email: 'lanny@hot.com', password: 'lala')
e1=Event.create(name: 'Camp Flog Gnaw Carnival', dis: 'formerly known as the OFWGKTA Carnival', user_id: a.id )
e2=Event.create(name: 'Gov Ball', dis: "music festival held in Randall's Island, New York City, USA", user_id: a.id)
Event.create(name: 'Rolling Loud', dis: 'Rolling Loud is a recurring music festival held in the United States of America.', user_id: a.id)
Event.create(name: 'Electric Zoo', dis: "Electric Zoo is an annual electronic music festival held over Labor Day weekend in New York City on Randall's Island.", user_id: b.id)
Event.create(name: 'SXSW', dis: 'Virtually taking over the city of Austin, everyone in the world of music from fans to media flock here to discover the next big thing.', user_id: b.id)
Rsvp.create(event_id: e2.id, user_id: a.id)
Rsvp.create(event_id: e2.id, user_id: b.id)