class AddPlanArrivalToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :plan_arrival, :datetime
  end
end
