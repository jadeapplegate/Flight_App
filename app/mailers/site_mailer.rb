class SiteMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']
  
  def flight_email(address, number, name, d_time, a_time, d_airport, a_airport, d_city, a_city, current_user_id)
    @current_user = User.find(current_user_id)
    @number = number
    @name = name
    @departure_time = d_time
    @arrival_time = a_time
    @departure_airport = d_airport
    @arrival_airport = a_airport
    @departure_city = d_city
    @arrival_city = a_city
    mail(to: address)
  end
end