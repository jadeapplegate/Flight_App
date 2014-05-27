class ContactsFlights < ActiveRecord::Base
  belongs_to :flight
  belongs_to :contact
end
