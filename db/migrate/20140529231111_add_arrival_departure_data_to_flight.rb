class AddArrivalDepartureDataToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :departure_terminal, :string
    add_column :flights, :departure_gate, :string
    add_column :flights, :arrival_terminal, :string
    add_column :flights, :arrival_gate, :string
    add_column :flights, :baggage_claim, :string
  end
end
