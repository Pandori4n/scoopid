require "open-uri"

SearchPartyAttendancy.destroy_all
SearchParty.destroy_all
LostPerson.destroy_all
User.destroy_all

p "everything is destroyed"

host = User.create!(email: "host@lewagon.fr", password: "123456", first_name: "Emily", last_name: "Watson", role: "host")
volunteer1 = User.create!(email: "volunteer1@lewagon.fr", password: "123456", first_name: "Nora", last_name: "Marley", role: "volunteer")
volunteer2 = User.create!(email: "volunteer2@lewagon.fr", password: "123456", first_name: "Robert", last_name: "Jones", role: "volunteer")

lost_one = LostPerson.new(first_name: "Missy", last_name: "Liberty", age: "25", last_known_location: "Paris", last_known_clothes: "Shiny dress", height: 170, body_type: "athletic", description: "Very happy girl", disparition_date_time: DateTime.new(2020,03,1,14), user_id: host.id)
file1 = URI.open('https://media.vogue.fr/photos/5c2f627093cd057e910d5789/master/w_828%2cc_limit/gettyimages_529372481_jpg_7253.jpg')
lost_one.photo.attach(io: file1, filename: 'missy.jpg', content_type: 'image/jpg')
lost_one.save!
p lost_one

search = SearchParty.create!(start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), meeting_location: "16, villa Gaudelet, Paris", description: "Big search for liberty", radius: 10, lost_person: lost_one)
p search

geojson_one = {
  'type': 'geojson',
  'data': {
    'type': 'Feature',
    'properties': {},
    'geometry': {
      'type': 'LineString',
      'coordinates': [
        [-122.48369693756104, 37.83381888486939],
        [-122.48348236083984, 37.83317489144141],
        [-122.48339653015138, 37.83270036637107],
        [-122.48356819152832, 37.832056363179625],
        [-122.48404026031496, 37.83114119107971],
        [-122.48404026031496, 37.83049717427869],
        [-122.48348236083984, 37.829920943955045],
        [-122.48356819152832, 37.82954808664175],
        [-122.48507022857666, 37.82944639795659],
        [-122.48610019683838, 37.82880236636284],
        [-122.48695850372314, 37.82931081282506],
        [-122.48700141906738, 37.83080223556934],
        [-122.48751640319824, 37.83168351665737],
        [-122.48803138732912, 37.832158048267786],
        [-122.48888969421387, 37.83297152392784],
        [-122.48987674713133, 37.83263257682617],
        [-122.49043464660643, 37.832937629287755],
        [-122.49125003814696, 37.832429207817725],
        [-122.49163627624512, 37.832564787218985],
        [-122.49223709106445, 37.83337825839438],
        [-122.49378204345702, 37.83368330777276]
      ]
    }
  }
}

geojson_two = {
  'type': 'geojson',
  'data': {
    'type': 'Feature',
    'properties': {},
    'geometry': {
      'type': 'LineString',
      'coordinates': [
        [-122.49369693756104, 37.84381888486939],
        [-122.49348236083984, 37.84317489144141],
        [-122.49339653015138, 37.84270036637107],
        [-122.49356819152832, 37.842056363179625],
        [-122.49404026031496, 37.84114119107971],
        [-122.49404026031496, 37.84049717427869],
        [-122.49348236083984, 37.839920943955045],
        [-122.49356819152832, 37.83954808664175],
        [-122.49507022857666, 37.83944639795659],
        [-122.49610019683838, 37.83880236636284],
        [-122.49695850372314, 37.83931081282506],
        [-122.49700141906738, 37.84080223556934],
        [-122.49751640319824, 37.84168351665737],
        [-122.49803138732912, 37.842158048267786],
        [-122.49888969421387, 37.84297152392784],
        [-122.49987674713133, 37.84263257682617],
        [-122.50043464660643, 37.842937629287755],
        [-122.50125003814696, 37.842429207817725],
        [-122.50163627624512, 37.842564787218985],
        [-122.50223709106445, 37.84337825839438],
        [-122.50378204345702, 37.84368330777276]
      ]
    }
  }
}

attendancy1 = SearchPartyAttendancy.create!(itinerary: geojson_one, start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer1, search_party: search)
attendancy2 = SearchPartyAttendancy.create!(itinerary: geojson_two, start_date_time: DateTime.new(2020,12,1,14), end_date_time: DateTime.new(2020,12,1,18), user: volunteer2, search_party: search)

p "seed done"