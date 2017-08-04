class AddNumberToDonuts < ActiveRecord::Migration[5.0]
  def change
  	add_column :donuts, :number, :integer
  end
end
