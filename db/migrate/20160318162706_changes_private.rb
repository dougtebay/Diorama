class ChangesPrivate < ActiveRecord::Migration
  def change
    remove_column :collections, :private?, :boolean
    add_column :collections, :privacy, :boolean
  end
end
