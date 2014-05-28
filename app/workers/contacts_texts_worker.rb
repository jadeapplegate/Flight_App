class ContactsTextsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  
#   sidekiq_options retry: false
  
#   def perform(current_user_id)
#     # number_to_send_to = +16173067739
#     current_user=User.find(current_user_id)
#     twilio_sid=ENV['TWILIO_SID']
#     twilio_token=ENV['TWILIO_TOKEN']
#     twilio_phone_number= +14155994592

#     @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

#     sms = @twilio_client.account.sms.messages.create(:body => "hello world",
#       :to => '+16173067739', 
#       :from => '+15005550006'
#       # :body => "hello world"
#     )
#     puts sms.to
#   end
end


