require "open-uri"

Message.destroy_all
SearchPartyAttendancy.destroy_all
SearchParty.destroy_all
FeedInfo.destroy_all
LostPerson.destroy_all
Chatroom.destroy_all
User.destroy_all

p "everything is destroyed"

host = User.create!(email: "host@lewagon.fr", password: "123456", first_name: "Emilie", last_name: "Chabert", role: "host")
volunteer1 = User.create!(email: "volunteer1@lewagon.fr", password: "123456", first_name: "Nora", last_name: "Chaffay", role: "volunteer")
volunteer2 = User.create!(email: "volunteer2@lewagon.fr", password: "123456", first_name: "Jules", last_name: "Martin", role: "volunteer")
volunteer3 = User.create!(email: "volunteer3@lewagon.fr", password: "123456", first_name: "Clémence", last_name: "Poret", role: "volunteer")
volunteer4 = User.create!(email: "volunteer4@lewagon.fr", password: "123456", first_name: "Anais", last_name: "Lafaye", role: "volunteer")

lost_one = LostPerson.new(first_name: "Marcel", last_name: "Desnoyers", age: "75", last_known_location: "Oberkampf, Paris", last_known_clothes: "Pull noir et pantalon beige", height: 170, body_type: "Mince", description: "Marcel se promène chaque matin rue Oberkampf, il porte souvent un chapeau noir et fait son marché boulevard de Belleville.", disparition_date_time: DateTime.new(2020,12,1,14), user_id: host.id)
file1 = URI.open('https://i.pinimg.com/564x/19/b3/fd/19b3fd5856523d2e97c1df62b3945377.jpg')
lost_one.photo.attach(io: file1, filename: 'missy.jpg', content_type: 'image/jpg')
lost_one.save!

chatroom1 = Chatroom.create!(name: "Battue samedi", volunteer: volunteer1, host: host, lost_person: lost_one)
chatroom2 = Chatroom.create!(name: "RDV", volunteer: volunteer2, host: host, lost_person: lost_one)

message1 = Message.create!(content: "Hey ! Merci de m'aider à retrouver Marcel. Je suis très inquiète...", chatroom: chatroom2, user: host)
message2 = Message.create!(content: "Pas de soucis ! J'espère qu'on va le retrouver !!!", chatroom: chatroom2, user: volunteer2)
message2 = Message.create!(content: "La boulangère de la rue l'aurai vu ce matin.", chatroom: chatroom2, user: volunteer2)
message1 = Message.create!(content: "Ok, tourne à droite, on vient de me confirmer qu'il serait dans cette rue.", chatroom: chatroom2, user: host)
message1 = Message.create!(content: "On y est presque, j'en suis sûr !", chatroom: chatroom2, user: host)

feed_info1 = FeedInfo.create!(title: "Infos", description: "Nous avons reçu un appel de la police, tout est deployé pour nous aider", user: host, lost_person: lost_one)
feed_info2 = FeedInfo.create!(title: "RDV", description: "RDV demain matin, 12 rue oberkampf, Paris, code 1971, 2eme etage", user: host, lost_person: lost_one)
feed_info3 = FeedInfo.create!(title: "Battue", description: "Merci à tous les volontaires!", user: host, lost_person: lost_one)


search = SearchParty.create!(date: DateTime.new(2020,12,3), start_time: DateTime.new(2020,12,3,14,00), end_time: DateTime.new(2020,12,3,18,00), meeting_location: "16 villa gaudelet, Paris", description: "Battue autour d'Oberkampf", radius: 1, lost_person: lost_one, authentication_token: "ABCDE")

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

coordinates_five = [
  [2.380073, 48.864990],
  [2.379197, 48.866046],
  [2.377464, 48.865702],
  [2.375426, 48.865243],
  [2.373784, 48.866238],
  [2.373108, 48.867212],
  [2.372384, 48.868137],
  [2.374618, 48.868386],
  [2.376281, 48.868845],
  [2.377319, 48.867608],
  [2.378604, 48.867962],
  [2.380216, 48.866399],
]

coordinates_six = [
  [2.380073, 48.864990],
  [2.379197, 48.866046],
  [2.382840, 48.866993],
  [2.386595, 48.867975],
  [2.385277, 48.868780],
  [2.382512, 48.867692],
  [2.378147, 48.870744],
  [2.375471, 48.869950],
  [2.373937, 48.869500],
  [2.377318, 48.865677],
]

attendancy1 = SearchPartyAttendancy.create!(itinerary: coordinates_three, color: "#E9C46A", start_date_time: DateTime.new(2020, 12, 1, 14), end_date_time: DateTime.new(2020, 12, 1, 18), user: volunteer1, search_party: search)
attendancy2 = SearchPartyAttendancy.create!(itinerary: coordinates_four, color: "#E76F51", start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer2, search_party: search)
attendancy3 = SearchPartyAttendancy.create!(itinerary: coordinates_five, color: "#9A031E", start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer3, search_party: search)
attendancy4 = SearchPartyAttendancy.create!(itinerary: coordinates_six, color: "#5F0F40", start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer4, search_party: search)

p "seed done"
