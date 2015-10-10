class AddCityAndStateToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :city, :string
    add_column :coffeeshops, :state, :string
  end
end
