class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user_name
      t.string :user_handle
      t.integer :collection_id
      t.string :text
      t.Datetime :date

      t.timestamps null: false
    end
  end
end
