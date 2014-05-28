class ContactsTextsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
 
  sidekiq_options retry: false


  def perform(contact_id)
    TwilioTexter.send_text(contact_id)
  end

end




