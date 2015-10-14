class DropImageLinkFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_link
  end
end
