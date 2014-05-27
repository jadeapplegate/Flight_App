class CreateContactsFlights < ActiveRecord::Migration
  def change
    create_table :contacts_flights do |t|
      t.integer :contact_id
      t.integer :flight_id

      t.timestamps
    end
  end
end
