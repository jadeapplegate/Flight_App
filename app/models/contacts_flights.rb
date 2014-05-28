class ContactsFlights < ActiveRecord::Base
  belongs_to :flight
  belongs_to :contact

  def contacts_for_flights
    where(["flight_id = ?", flight_id]).map { |flight| flight.contact }
  end
end


