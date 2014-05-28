class DailyCheckersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
    daily.hour_of_day(10).minute_of_hour(1)
  end
  
  def perform
    flights_today
  end
end