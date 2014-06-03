class TwilioTexter
  require 'twilio-ruby' 

  def self.send_text(flight_id, contact_id, current_user_id)
    twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
    flight = Flight.find(flight_id)
    contact = Contact.find(contact_id)
    user = User.find(current_user_id)
    if flight.baggage_claim == nil
      flight.baggage_claim = "unavailable"
    end
    if flight.arrival_terminal == nil
      flight.arrival_terminal = "unavailable"
    end
    if flight.arrival_gate == nil
      flight.arrival_gate = "unavailable"
    end

    sms = twilio_client.account.sms.messages.create(
      :body => "FlightShare info: " + user.full_name.to_s.titleize + "s " + flight.airline_name.to_s + " flight #" + flight.flight_number.to_s +  " will be arriving at terminal " + flight.arrival_terminal.to_s + ", gate " + flight.arrival_gate.to_s + ", baggage claim number " + flight.baggage_claim.to_s + ".",
      :to => '+16173067739', #@contact.phone 
      :from => '+14155994592'
      )
  end
end
