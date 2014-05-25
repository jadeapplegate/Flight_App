class UsersController < ApplicationController
  
  def profile
    @flights = Flight.all
    @contacts = Contact.all
    @contact = Contact.new
  end

end
