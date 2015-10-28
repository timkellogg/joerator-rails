class CreateCoffeeshopsUsers < ActiveRecord::Migration
  def change
    create_table :coffeeshops_users do |t|
      t.belongs_to :coffeeshop
      t.belongs_to :user
    end
  end
end
