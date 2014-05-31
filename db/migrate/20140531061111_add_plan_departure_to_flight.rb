class AddPlanDepartureToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :plan_departure, :datetime
  end
end
