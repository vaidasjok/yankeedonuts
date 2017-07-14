class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :title


      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
