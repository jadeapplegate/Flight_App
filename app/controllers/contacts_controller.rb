class ContactsController < ApplicationController
  load_and_authorize_resources

  def index
    @contact = user.contacts
  end

  def show
    @contacts = Contacts.all
  end

  def new
    @contact = Contact.new

  end

  def create
    @contact = Contact.create(contact_params)
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end

end