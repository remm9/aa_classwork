class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, :artist_id
    remove_index :artworks, :title

  end
end
