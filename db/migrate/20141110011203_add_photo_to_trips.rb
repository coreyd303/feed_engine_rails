class AddPhotoToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :coverphoto, :string
  end
end
