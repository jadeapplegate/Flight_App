class EmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(number, name, d_time, a_time, d_airport, a_airport, d_city, a_city)
    SiteMailer.person_email(number, name, d_time, a_time, d_airport, a_airport, d_city, a_city).deliver
  end
end