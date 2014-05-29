class UsersController < ApplicationController
  
  def profile
    if current_user
      @flight = Flight.new
      @flights = current_user.flights
      @contacts = current_user.contacts
      @contact = Contact.new
    else
      redirect_to root_path
      flash[:error] = "Please sign in or sign up"
    end
  end

end
