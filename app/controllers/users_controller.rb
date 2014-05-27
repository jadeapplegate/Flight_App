class UsersController < ApplicationController
  
  def profile
    @flight = Flight.new
    @flights = current_user.flights
    @contacts = current_user.contacts
    @contact = Contact.new
  end

end
