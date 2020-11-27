require "open-uri"

Message.destroy_all
SearchPartyAttendancy.destroy_all
SearchParty.destroy_all
FeedInfo.destroy_all
LostPerson.destroy_all
Chatroom.destroy_all
User.destroy_all

p "everything is destroyed"

host = User.create!(email: "host@lewagon.fr", password: "123456", first_name: "Emily", last_name: "Watson", role: "host")
volunteer1 = User.create!(email: "volunteer1@lewagon.fr", password: "123456", first_name: "Nora", last_name: "Marley", role: "volunteer")
volunteer2 = User.create!(email: "volunteer2@lewagon.fr", password: "123456", first_name: "Robert", last_name: "Jones", role: "volunteer")

lost_one = LostPerson.new(first_name: "Missy", last_name: "Liberty", age: "25", last_known_location: "Paris", last_known_clothes: "Shiny dress", height: 170, body_type: "athletic", description: "Very happy girl", disparition_date_time: DateTime.new(2020,03,1,14), user_id: host.id)
file1 = URI.open('https://media.vogue.fr/photos/5c2f627093cd057e910d5789/master/w_828%2cc_limit/gettyimages_529372481_jpg_7253.jpg')
lost_one.photo.attach(io: file1, filename: 'missy.jpg', content_type: 'image/jpg')
lost_one.save!

chatroom1 = Chatroom.create!(name: "Saturday Search Party", volunteer: volunteer1, host: host, lost_person: lost_one)
chatroom2 = Chatroom.create!(name: "Meeting", volunteer: volunteer2, host: host, lost_person: lost_one)

message1 = Message.create!(content: "Are you available tomorrow at 10 for a meeting?", chatroom: chatroom2, user: volunteer2)

feed_info1 = FeedInfo.create!(title: "Meeting", description: "Meeting saturday at 10 at home, 12 rue de Rivoli", user: host, lost_person: lost_one)
feed_info2 = FeedInfo.create!(title: "Search Party", description: "Thank you for being volunteers", user: host, lost_person: lost_one)
feed_info3 = FeedInfo.create!(title: "News", description: "We receive a call from the police", user: host, lost_person: lost_one)

search = SearchParty.create!(start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), meeting_location: "16, villa Gaudelet, Paris", description: "Big search for liberty", radius: 10, lost_person: lost_one, authentication_token: "ABCDE")

coordinates_three = [
  [2.380073, 48.864990],
  [2.379197, 48.866046],
  [2.381290, 48.866593],
  [2.382651, 48.865113],
  [2.383160, 48.864339],
  [2.382274, 48.863834],
  [2.377996, 48.864652],
  [2.377335, 48.865661],
  [2.379223, 48.866086]
 ]

coordinates_four = [
  [2.380073, 48.864990],
  [2.379197, 48.866046],
  [2.380213, 48.866373],
  [2.378573, 48.867993],
  [2.375913, 48.867298],
  [2.377327, 48.865661],
  [2.379219, 48.866089]
]

attendancy1 = SearchPartyAttendancy.create!(itinerary: coordinates_three, color: "#777", start_date_time: DateTime.new(2020, 12, 1, 14), end_date_time: DateTime.new(2020, 12, 1, 18), user: volunteer1, search_party: search)
attendancy2 = SearchPartyAttendancy.create!(itinerary: coordinates_four, color: "#222", start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer2, search_party: search)

p "seed done"
