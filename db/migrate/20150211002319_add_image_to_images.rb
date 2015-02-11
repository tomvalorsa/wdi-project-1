class AddImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :image, :text
  end
end
