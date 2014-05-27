class UserEmailsWorker
  include Sidekiq::Worker
  
  sidekiq_options retry: false
  
  def perform(flight_id, current_user_id)
    SiteMailer.confirm_user(flight_id, current_user_id).deliver
  end
end