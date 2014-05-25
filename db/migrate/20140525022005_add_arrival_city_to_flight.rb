class AddArrivalCityToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :arrival_city, :string
  end
end
