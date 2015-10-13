class AddLatitudeAndLongitudeToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :latitude, :float
    add_column :coffeeshops, :longitude, :float
  end
end
