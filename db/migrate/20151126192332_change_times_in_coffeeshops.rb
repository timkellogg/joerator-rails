class ChangeTimesInCoffeeshops < ActiveRecord::Migration
  def change
    remove_column :coffeeshops, :opens_at
    remove_column :coffeeshops, :closes_at

    add_column :coffeeshops, :weekday_opens_at,  :time
    add_column :coffeeshops, :weekday_closes_at, :time
    add_column :coffeeshops, :weekend_opens_at,  :time
    add_column :coffeeshops, :weekend_closes_at, :time
  end
end
