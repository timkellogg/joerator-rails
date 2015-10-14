class AddPictureToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :picture, :string 
  end
end
