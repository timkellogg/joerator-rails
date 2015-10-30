class AddCounterCachingToCoffeeshopReviews < ActiveRecord::Migration
  def up
    add_column :coffeeshops, :reviews_count, :integer, default: 0
    add_index :coffeeshops, :reviews_count
  end

  def down
    remove_column :coffeeshops, :reviews_count
  end
end
