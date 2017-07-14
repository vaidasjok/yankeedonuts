class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.integer :parent
      t.text :description
      t.string :seo_title
      t.text :seo_description
      t.string :menu

      t.timestamps
    end
  end
end
