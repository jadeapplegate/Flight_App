class EmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(address, number, name, d_time, a_time, d_airport, a_airport, d_city, a_city, current_user_id)
    SiteMailer.flight_email(address, number, name, d_time, a_time, d_airport, a_airport, d_city, a_city, current_user_id).deliver
  end
end