class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string   :name
      t.text     :description
      t.datetime :date
      t.string   :location
      t.timestamps
    end
  end
end
