class AddResortsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :resort_id, :integer
  end
end
