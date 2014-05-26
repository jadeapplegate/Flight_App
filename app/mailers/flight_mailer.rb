class FlightMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email (user, contact, flight)
    @flight = flight 
    @user = user
    @contact = contact 
    mail(to: @contact.email, subject: "Flight status of #{@user.name}")
end
