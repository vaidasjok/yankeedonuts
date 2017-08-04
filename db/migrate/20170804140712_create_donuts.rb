class CreateDonuts < ActiveRecord::Migration[5.0]
  def change
    create_table :donuts do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
