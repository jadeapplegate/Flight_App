class TwilioTexter
  require 'twilio-ruby' 

  twilio_sid = ENV['TWILIO_SID']
  twilio_token = ENV['TWILIO_TOKEN']
  @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  def self.send_text #(contact_id)
    #contact=Contact.find(contact_id)

    sms = @twilio_client.account.sms.messages.create(
      :body => "it works",
      :to => '+16173067739', #contact.phone 
      :from => '+14155994592'
    )
  end

end
