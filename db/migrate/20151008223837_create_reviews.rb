class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.string :body
      t.string :title
      t.integer :qualityRating
      t.integer :hipsterRating
      t.integer :studyRating
      t.integer :laptopRating
      t.references :coffeeshop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
