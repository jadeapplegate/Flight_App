class ContactsTextsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  
  sidekiq_options retry: false
  
  def perform
  end
end