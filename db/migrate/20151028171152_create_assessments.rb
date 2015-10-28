class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.integer :coffeeshop_id

      t.timestamps
    end
  end
end
