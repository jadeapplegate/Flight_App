# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
flight1 = Flight.create(flight_number: 902, airline_name: "Virgin America", date_year: 2014, date_month: 6, date_day: 3, departure_airport: "SFO" , arrival_airport: "LAS" , stops: 0 , departure_time: "2014-06-03T09:00:00.000" , arrival_time: "2014-06-03T10:35:00.000", user_id: 1, airline_code: "VX")

user1 = User.create(email: "josh@gmail.com", first_name: "Joshua", last_name: "Pearson")

contact1 = Contact.create(first_name: "Snoopy", last_name: "Pearson", email: "snoopy@gmail.com", phone: "+1 415 599 2671", user_id: 1)
contact2 = Contact.create(first_name: "David", last_name: "Lucy", email: "dc@gmail.com", phone: "+1 415 599 3456", user_id: 1)
contact3 = Contact.create(first_name: "Amy", last_name: "Nuszen", email: "aj@gmail.com", phone: "+1 415 599 1234", user_id: 1)

