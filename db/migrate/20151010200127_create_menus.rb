class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :coffeeshop_id, index: true 
    end
  end
end

