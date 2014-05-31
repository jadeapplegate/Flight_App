class AddFlightstatsIdToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :flightstats_id, :string
  end
end
