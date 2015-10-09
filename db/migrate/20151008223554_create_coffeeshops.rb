class CreateCoffeeshops < ActiveRecord::Migration
  def change
    create_table :coffeeshops do |t|
      t.string :name
      t.string :address
      t.integer :qualityRating
      t.integer :studyRating
      t.integer :laptopRating
      t.integer :hipsterRating
      t.string :imageLink
      t.string :webAddress

      t.timestamps null: false
    end
  end
end
