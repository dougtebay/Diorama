class ChangesTwitterIdinTweets < ActiveRecord::Migration
  def change
    change_column :tweets, :twitter_id, :string
  end
end
