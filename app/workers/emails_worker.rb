class EmailsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(a,s,b)
    SiteMailer.person_email(a,s,b).deliver
  end
end