class CreateLibrariesPosts < ActiveRecord::Migration
  def change
    create_table :libraries_posts do |t|
      t.integer :library_id
      t.integer :post_id
    end
  end
end
