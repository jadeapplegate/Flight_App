class ContactsTextsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
 
# #   sidekiq_options retry: false
  
# #   def perform(current_user_id)
# #     # number_to_send_to = +16173067739
# #     current_user=User.find(current_user_id)
# #     twilio_sid=ENV['TWILIO_SID']
# #     twilio_token=ENV['TWILIO_TOKEN']
# #     twilio_phone_number= +14155994592

#   # include Sidetiq::Schedulable
#   require 'twilio-ruby' 
#   sidekiq_options retry: false
  
#   def perform(current_user_id)
#     number_to_send_to = +16173067739
#     current_user=User.find(current_user_id)
#     twilio_sid=ENV['TWILIO_SID']
#     twilio_token=ENV['TWILIO_TOKEN']
#     twilio_phone_number= '+15005550006'


# #     @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

# #     sms = @twilio_client.account.sms.messages.create(:body => "hello world",
# #       :to => '+16173067739', 
# #       :from => '+15005550006'
# #       # :body => "hello world"
# #     )
# #     puts sms.to
# #   end
# end

# # require 'twilio-ruby'
# # class SendSMS
# #   include Sidekiq::Worker

# #   def perform(record_id)
# #     record = Collection.find record_id
# #     @twilio = Twilio::REST::Client.new "[Your Account SID]", "[Your Token]"

# #     @twilio.account.messages.create(
# #       from: '[Your Phone Number]',
# #       to: record.phone_number,
# #       body: 'Hey there!  This is your reminder.'
# #     )
# #   end
# # end

# require 'twilio-ruby' 
# @client = Twilio::REST::Client.new 'AC7652e59aaf5a9993eb94e7935834cc0c', '0cf7d18d072407c3a0328c76ffc6f64a'

# @client.account.messages.create(
#     :from => '+15005550006',
#     :to => '+16173067739',
#     :body => 'please please work'
    )

  def perform(contact_id)
    TwilioTexter.send_text(contact_id)
  end

end

