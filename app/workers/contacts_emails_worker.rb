class ContactsEmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(address, flight_id, current_user_id, contact_id)
    SiteMailer.flight_email(address, flight_id, current_user_id, contact_id).deliver
  end
end