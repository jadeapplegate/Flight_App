class ContactsController < ApplicationController
  load_and_authorize_resources

  def create
    @contact = Contact.create(contact_params)
    flash[:notice] = "Contact successfully created"
    render :profile
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end

end
