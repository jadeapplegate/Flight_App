class UsersController < ApplicationController
  
  def profile
    @flights = Flight.all
    @contacts = Contact.all
    @contact = Contact.new
  end







  # private
  # def flight_params
  #   params.require(:flight).permit(:flight_number, :airline_name, :date_year, :date_month, :date_day)
  # end

end
