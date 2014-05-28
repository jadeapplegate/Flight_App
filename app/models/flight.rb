class Flight < ActiveRecord::Base
  belongs_to :user
  has_many :contacts_flights
  has_many :contacts, through: :contacts_flights

  validates :flight_number, presence: true
  validates_length_of :flight_number, :minimum => 2
  validates :airline_code, presence: true
  validates_length_of :airline_code, :is => 2
  validates :date_month, presence: true
  validates_length_of :date_month, :minimum => 1, :maximum => 2
  validates :date_day, presence: true
  validates_length_of :date_day, :minimum => 1, :maximum => 2
  validates :date_year, presence: true
  validates_length_of :date_year, :is => 4

  def flights_today
    todays_flights = Flight.where("departure_time BETWEEN ? AND ?", DateTime.current.beginning_of_day, DateTime.tomorrow.beginning_of_day)
    if todays_flight.empty? == false
      todays_flights.each do |flight|
        flight_id = flight.id 
        todays_contacts = ContactsFlights.where(["flight_id = ?", flight_id]).map { |flight| flight.contact }
        if todays_contacts.empty? == false
          todays_contacts.each do |contact|
            contact_id = contact.id
            DailyEmailsWorker.perform_async(flight_id, contact_id)
          end
        end
      end
    end
  end

end
