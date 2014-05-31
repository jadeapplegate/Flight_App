class DelaysTextsWorker
  include Sidekiq::Worker

  def perform(flight_id, contact_id, user_id)
    TwilioTexter.contacts_delay_text(flight_id, contact_id, user_id)
  end
end
