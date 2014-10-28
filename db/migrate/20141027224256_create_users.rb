class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :password_digest
      t.string   :instagram_username
      t.string   :twitter_username
      t.string   :epic_username
      t.string   :epic_password
      t.timestamps
    end
  end
end
