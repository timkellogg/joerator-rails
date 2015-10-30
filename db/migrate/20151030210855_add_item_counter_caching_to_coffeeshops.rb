class AddItemCounterCachingToCoffeeshops < ActiveRecord::Migration
  def up
    add_column :coffeeshops, :items_count, :integer, default: 0
    add_index :coffeeshops, :items_count
  end

  def down
    remove_column :coffeeshops, :items_count
  end
end


