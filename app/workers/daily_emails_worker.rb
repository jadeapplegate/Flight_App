class DailyEmailsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  
  def perform
    SiteMailer.daily_email(flight_id, contact_id).deliver
  end
end