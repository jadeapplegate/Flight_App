class SiteMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def flight_email(address, flight_id, current_user_id)
    @user = User.find(current_user_id)
    @flight = Flight.find(flight_id)
    mail(to: address, subject: @user.full_name + " has sent you flight info")
  end

  def confirm_user(flight_id, current_user_id)
     @flight = Flight.find(flight_id)
     @user = User.find(current_user_id)
     mail(to: @user.email, subject: "Flight confirmation")
   end
end