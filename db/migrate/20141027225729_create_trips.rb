class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string   :name
      t.text     :description
      t.datetime :date
      t.integer  :resort_id
      t.timestamps
      t.index    :resort_id
    end
  end
end
