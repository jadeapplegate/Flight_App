class ContactsController < ApplicationController
  load_and_authorize_resources

  def index
    @contact = user.contacts
  end
end
