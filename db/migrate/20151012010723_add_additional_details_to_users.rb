class AddAdditionalDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :favorite_coffee, :string
    add_column :users, :location, :string
    add_column :users, :facebook_link, :string
    add_column :users, :twitter_link, :string
    add_column :users, :google_link, :string
    add_column :users, :instagram_link, :string
  end
end
