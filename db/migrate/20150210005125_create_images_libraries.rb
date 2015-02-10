class CreateImagesLibraries < ActiveRecord::Migration
  def change
    create_table :images_libraries do |t|
      t.integer :image_id
      t.integer :library_id
    end
  end
end
