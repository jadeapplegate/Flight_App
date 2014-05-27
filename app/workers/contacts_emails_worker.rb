class ContactsEmailsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  sidekiq_options retry: false
  
  def perform(address, flight_id, current_user_id)
    SiteMailer.flight_email(address, flight_id, current_user_id).deliver
  end
end