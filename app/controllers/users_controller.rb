class UsersController < ApplicationController
  
  def profile
    if current_user
      @flight = Flight.new
      @flights = current_user.flights.where("departure_time > ?", DateTime.now - 7.hours)
      @contacts = current_user.contacts
      @contact = Contact.new
    else
      redirect_to root_path
      flash[:error] = "Please sign in or sign up"
    end
  end

end
