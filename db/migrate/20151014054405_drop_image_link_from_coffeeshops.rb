class DropImageLinkFromCoffeeshops < ActiveRecord::Migration
  def change
    remove_column :coffeeshops, :imageLink
  end
end
