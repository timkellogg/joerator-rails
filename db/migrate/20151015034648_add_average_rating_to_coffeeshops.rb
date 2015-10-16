class AddAverageRatingToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :overall_average, :float, default: 0
  end
end
