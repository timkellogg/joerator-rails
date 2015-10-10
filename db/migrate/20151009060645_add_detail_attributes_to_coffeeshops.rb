class AddDetailAttributesToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :opens_at, :time
    add_column :coffeeshops, :closes_at, :time
    add_column :coffeeshops, :price, :integer
    add_column :coffeeshops, :accepts_credit, :boolean, default: true
    add_column :coffeeshops, :parking, :string
    add_column :coffeeshops, :style, :string
    add_column :coffeeshops, :vegan_friendly, :boolean, default: false
    add_column :coffeeshops, :veggie_friendly, :boolean, default: false
  end
end
