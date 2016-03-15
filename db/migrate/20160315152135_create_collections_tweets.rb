class CreateCollectionsTweets < ActiveRecord::Migration
  def change
    create_table :collections_tweets do |t|
      t.integer :collection_id
      t.integer :tweet_id

      t.timestamps null: false
    end
  end
end
