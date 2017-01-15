class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.timestamps
      t.string :name
    end
  end
end
