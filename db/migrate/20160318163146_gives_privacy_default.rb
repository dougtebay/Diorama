class GivesPrivacyDefault < ActiveRecord::Migration
  def change
     change_column_default :collections, :privacy, :true
  end
end
