class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :twitter_profile
      t.string :email_add
      t.string :password

      t.timestamps null: false
    end
  end
end
