class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
