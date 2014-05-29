class TwilioTexter
  require 'twilio-ruby' 

  twilio_sid = ENV['TWILIO_SID']
  twilio_token = ENV['TWILIO_TOKEN']
  @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  def send_text(flight_id, contact_id, current_user_id)
    @flight = Flight.find(flight_id)
    @contact = Contact.find(contact_id)
    @user = User.find(current_user_id)
    if @flight.baggage_claim == nil
      @flight.baggage_claim = "unavailable"
    end
    if @flight.arrival_terminal == nil
      @flight.arrival_terminal = "unavailable"
    end
    if @flight.arrival_gate == nil
      @flight.arrival_gate = "unavailable"
    end

    sms = @twilio_client.account.sms.messages.create(
      :body => "FlightShare is letting you know that " + @user.full_name.to_s + " is about to get on their flight. " + @user.first_name.to_s + " will be arriving at " + @flight.arrival_terminal.to_s + ", at Gate " + @flight.arrival_gate.to_s + ", baggage claim number " + @flight.baggage_claim.to_s,
      :to => '+16173067739', #@contact.phone 
      :from => '+14155994592'
    )
  end
end
