class RemovesCollectionIdFromTweets < ActiveRecord::Migration
  def change

    remove_column :tweets, :collection_id
  end
end
