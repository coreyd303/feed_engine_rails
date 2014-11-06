class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :password_digest
      t.string   :instagram_username
      t.integer  :instagram_id
      t.string   :twitter_username
      t.string   :epic_mix_username
      t.string   :epic_mix_password
      t.timestamps
    end
  end
end
