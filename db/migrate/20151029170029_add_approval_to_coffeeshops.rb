class AddApprovalToCoffeeshops < ActiveRecord::Migration
  def change
    add_column :coffeeshops, :approved, :boolean, default: false
  end
end
