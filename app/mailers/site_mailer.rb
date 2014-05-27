class SiteMailer < ActionMailer::Base
  default to: @recipients
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def person_email(number, name, d_time, a_time, d_airport, a_airport, d_city, a_city)
    @number = number
    @name = name
    @departure_time = d_time
    @arrival_time = a_time
    @departure_airport = d_airport
    @arrival_airport = a_airport
    @departure_city = d_city
    @arrival_city = a_city
    mail(subject: subject, body: body)
  end

  # def contact_email (user, contact, flight) #mailer method that will send initial confirmation email to a contact
  #   @flight = flight 
  #   @user = user
  #   @contact = contact 
  #   mail(subject: "Flight stats of #{@user.first_name}")
  # end

  # def user_email(user, flight) #mailer method that will send initial confirmation email to a user
  #   @flight = flight 
  #   @user = user 
  #   mail(subject: "Flight stats confirmation ")
  # end

  # def alert_email(user, contact, flight) #method that will send alert message if there's a change in flight schedule
  #   @flight = flight 
  #   @user = user 
  #   @contact = contact 
  #   mail(to: @user.email, subject: "Change in Flight schedule") 
  #   mail(to: @contact.email, subject: "Change in Flight schedule")
  # end
end