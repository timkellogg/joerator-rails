class AddAveragesToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :average_hipster, :float, default: 0
    add_column :coffeeshops, :average_study,   :float, default: 0
    add_column :coffeeshops, :average_laptop,  :float, default: 0
    add_column :coffeeshops, :average_quality, :float, default: 0
  end
end
