class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :source
      t.text :description
      t.text :image_url
      t.integer :user_id
      t.timestamps
    end
  end
end
