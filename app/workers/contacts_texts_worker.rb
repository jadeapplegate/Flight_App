class ContactsTextsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  
  def perform  
  end
end