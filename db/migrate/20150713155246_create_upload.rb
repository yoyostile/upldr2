class CreateUpload < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :ip
      t.timestamps
      t.string :file
      t.string :token
    end
  end
end
