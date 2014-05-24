class AddContactIdToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :contact_id, :integer
  end
end
