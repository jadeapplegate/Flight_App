class EmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform_contact_email(address, flight_id, current_user_id)
    SiteMailer.flight_email(address, flight_id, current_user_id).deliver
  end

  def perform_user_email
    SiteMailer.
  end

  recurrance { daily }

  def perform_user_twillio
    @flights = Flight.all

  end

  def perform_contact_twillio
  end
end