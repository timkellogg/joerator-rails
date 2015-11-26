class AddPhoneToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :phone, :string
  end
end
