class DailyCheckersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
    daily.hour_of_day(0).minute_of_hour(1)
  end
  
  def perform
    todays_flights = Flight.where("departure_time BETWEEN ? AND ?", DateTime.current.beginning_of_day, DateTime.tomorrow.beginning_of_day)
    if todays_flights.empty? == false
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