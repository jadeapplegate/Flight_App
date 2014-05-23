class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.string :airline_name
      t.integer :date_year
      t.integer :date_month
      t.integer :date_day
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :stops
      t.datetime :departure_time
      t.datetime :arrival_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
