class CreateTripsUsers < ActiveRecord::Migration
  def change
    create_table :trips_users, id: false do |t|
      t.belongs_to :trip
      t.belongs_to :user
      t.index      :trip_id
      t.index      :user_id
    end
  end
end
