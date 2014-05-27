class SiteMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def flight_email(address, flight_id, current_user_id)
    @current_user = User.find(current_user_id)
    @flight = Flight.find(flight_id)
    mail(to: address)
  end

  def confirm_user(flight_id, current_user_id)
    @flight = Flight.find(flight_id)
    @current_user = User.find(current_user_id)
    mail(to: @current_user.email, subject: "Flight confirmation")
  end
end