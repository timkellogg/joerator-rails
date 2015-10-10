class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :menu, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :veggie_friendly, default: false
      t.boolean :vegan_friendly,  default: false 
      t.boolean :gluten_free,     default: false
      t.string :type
      t.string :image_link
      t.integer :price, precision: 5, scope: 2
    end
  end
end
