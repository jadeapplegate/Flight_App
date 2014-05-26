class FlightMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email (user, contact, flight) #mailer method that will send initial confirmation email to a contact
    @flight = flight 
    @user = user
    @contact = contact 
    mail(to: @contact.email, subject: "Flight stats of #{@user.name}")
  end

  def user_email(user, flight) #mailer method that will send initial confirmation email to a user
    @flight = flight 
    @user = user 
    mail(to: @user.email, subject: "Flight stats confirmation ")
  end

  def alert_email(user, contact, flight) #method that will send alert message if there's a change in flight schedule
    @flight = flight 
    @user = user 
    @contact = contact 
    mail(to: @user.email, subject: "Change in Flight schedule")
    mail(to: @contact.email, subject: "Change in Flight schedule")
  end
end
