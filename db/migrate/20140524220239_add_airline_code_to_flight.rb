class AddAirlineCodeToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :airline_code, :string
  end
end
