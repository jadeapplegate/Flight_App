class UserDelaysTextsWorker
  include Sidekiq::Worker

  def perform(flight_id, user_id)
    TwilioTexter.user_delay_text(flight_id, user_id)
  end
end