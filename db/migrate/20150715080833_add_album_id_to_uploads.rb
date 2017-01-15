class AddAlbumIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :album_id, :integer
  end
end
