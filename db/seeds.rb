# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Flights 
flight1 = Flight.create(flight_number: 902, airline_name: "Virgin America", date_year: 2014, date_month: 6, date_day: 3, departure_airport: "SFO" , arrival_airport: "LAS" , stops: 0 , departure_time: "2014-06-03T09:00:00.000" , arrival_time: "2014-06-03T10:35:00.000", user_id: 1, airline_code: "VX")

flight = Flight.create(flight_number: 752, airline_name: "Alaska Airlines", date_year: 2014, date_month: 3, date_day: 2, departure_airport: "ATL", arrival_airport: "PDX", stops: 0, airline_code: "AS")

#Users 
user1 = User.create(email: "josh@gmail.com", first_name: "Joshua", last_name: "Pearson")

#Contacts 
contact1 = Contact.create(first_name: "Snoopy", last_name: "Pearson", email: "snoopy@gmail.com", phone: "+1 415 599 2671", user_id: 1)

contact = Contact.create( first_name: 'Phil', last_name: 'Delphia', email: 'test@test.com', phone: '+1 555 555 5555', user_id: 1)

contact2 = Contact.create( first_name: 'Henry', last_name: 'Huang', email: 'hhuang2088@gmail.com', phone: '+1 415 218 7482', user_id: 1)




