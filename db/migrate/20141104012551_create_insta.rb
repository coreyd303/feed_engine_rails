class CreateInsta < ActiveRecord::Migration
  def change
    create_table :insta do |t|
      t.integer  :insta_id
      t.integer  :user_id
      t.integer  :trip_id
      t.string   :insta_url
      t.string   :thumbnail_url
      t.string   :full_size_url
      t.timestamps
      t.index    :user_id
      t.index    :trip_id
    end
  end
end
