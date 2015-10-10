class RenameTypeToMealTypeInItems < ActiveRecord::Migration
  def change
    rename_column :items, :type, :meal_type
  end
end
