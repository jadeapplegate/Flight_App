class FlightsController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new flight_params
    @flight.user = current_user
    send_text
    if @flight.save
      flight = @flight
      UserEmailsWorker.perform_async(flight.id, current_user.id)
      recipients = params["flight"]["contacts"]
      recipients.each do |id|
        ContactsFlights.create(contact_id: id, flight_id: flight.id)
        contact = Contact.find(id)
        address = contact.email
        ContactsEmailsWorker.perform_async(address, flight.id, current_user.id, contact.id)
      end
    end
    respond_to do |format|
      if @flight.save
        format.json { render json: @flight, status: :created }
      else
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_text
    number_to_send_to = +16173067739

    twilio_sid=ENV['TWILIO_SID']
    twilio_token=ENV['TWILIO_TOKEN']
    twilio_phone_number= +14155994592

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{4155994592}",  
      :to => "+1#{6173067739}", 
      :body => "#{user.first_name} will be flying"
    )

  end

private
  def flight_params
    params.require(:flight).permit(:flight_number, :airline_name, :date_year, :date_month, :date_day, :departure_airport, :arrival_airport, :stops, :departure_time, :arrival_time, :airline_code, :departure_city, :arrival_city)
  end

# ContactsFlights.where(["flight_id = ?", 21]).map { |flight| flight.contact }

end
