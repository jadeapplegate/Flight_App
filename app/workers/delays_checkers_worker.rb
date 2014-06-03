class DelaysCheckersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
    hourly.minute_of_hour(5, 35)
  end
  
  def perform
    possible_delay_flights = Flight.where("departure_time BETWEEN ? AND ?", DateTime.now - 7.hours, DateTime.now - 4.hours)
    if possible_delay_flights.empty? == false
      possible_delay_flights.each do |flight|
        flight_id = flight.id 
        text_contacts = ContactsFlights.where(["flight_id = ?", flight_id]).map { |flight| flight.contact }
        if text_contacts.empty? == false
          text_contacts.each do |contact|
            contact_id = contact.id   
            user_id = contact.user.id 
            response = Typhoeus.get("https://api.flightstats.com/flex/flightstatus/rest/v2/json/flight/status/" + flight.flightstats_id.to_s + "?appId=" + ENV['API_ID'].to_s + "&appKey=" + ENV['APP_KEY'].to_s)
            body = JSON.parse(response.body)
            flight.plan_departure = body["flightStatus"]["operationalTimes"]["flightPlanPlannedDeparture"]["dateLocal"]
            flight.plan_arrival = body["flightStatus"]["operationalTimes"]["flightPlanPlannedArrival"]["dateLocal"]
            if (flight.plan_departure - flight.departure_time) > 960
              DelaysTextsWorker.perform_async(flight_id, contact_id, user_id)
            end
          end
        end
      end
    end    
  end
end