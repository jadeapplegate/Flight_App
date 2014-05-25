class AddDepartureCityToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :departure_city, :string
  end
end
