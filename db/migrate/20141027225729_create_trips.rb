class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string   :name
      t.text     :description
      t.integer  :group_id
      t.datetime :start_time
      t.datetime :end_time
      t.string   :location
      t.timestamps
    end
  end
end
