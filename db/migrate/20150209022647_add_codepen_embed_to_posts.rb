class AddCodepenEmbedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :codepen_embed, :text
  end
end
