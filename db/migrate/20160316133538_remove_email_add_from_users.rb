class RemoveEmailAddFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email_add, :string
  end
end
