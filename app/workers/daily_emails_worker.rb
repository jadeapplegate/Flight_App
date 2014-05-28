class DailyEmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(flight_id, contact_id)
    SiteMailer.daily_email(flight_id, contact_id).deliver
  end
end