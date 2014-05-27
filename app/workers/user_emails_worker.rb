class UserEmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
<<<<<<< HEAD
  def perform(flight_id, current_user_id)
=======
  def perform_contact_email(address, flight_id, current_user_id)
    SiteMailer.confirm_user(flight_id, current_user_id).deliver
>>>>>>> corrected user_email_worker, and formatted confirm_user method parameters
  end
end