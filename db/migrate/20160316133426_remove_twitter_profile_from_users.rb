class RemoveTwitterProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :twitter_profile, :string
  end
end
