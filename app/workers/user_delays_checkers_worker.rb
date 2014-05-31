class UserDelaysCheckersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
    hourly.minute_of_hour(1, 31)
  end
  
  def perform
    possible_delay_flights = Flight.where("departure_time BETWEEN ? AND ?", DateTime.now - 7.hours, DateTime.now - 3.hours)
    if possible_delay_flights.empty? == false
      possible_delay_flights.each do |flight|
        flight_id = flight.id 
        user_id = flight.user.id
        response = Typhoeus.get("https://api.flightstats.com/flex/flightstatus/rest/v2/json/flight/status/" + flight.flightstats_id.to_s + "?appId=" + ENV['API_ID'].to_s + "&appKey=" + ENV['APP_KEY'].to_s)
        body = JSON.parse(response.body)
        flight.plan_departure = body["flightStatus"]["operationalTimes"]["flightPlanPlannedDeparture"]
        flight.plan_arrival = body["flightStatus"]["operationalTimes"]["flightPlanPlannedArrival"]
        if (flight.plan_departure - flight.departure_time) > 960
          UserDelaysTextsWorker.perform_async(flight_id, user_id)
        end
      end
    end
  end
end
