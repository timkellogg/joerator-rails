class RemoveAggRatingsColumnsFromCoffeeshops < ActiveRecord::Migration
  def change
    remove_column :coffeeshops, :qualityRating
    remove_column :coffeeshops, :studyRating
    remove_column :coffeeshops, :laptopRating
    remove_column :coffeeshops, :hipsterRating
  end
end

