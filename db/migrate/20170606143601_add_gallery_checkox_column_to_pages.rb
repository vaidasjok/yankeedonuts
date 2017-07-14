class AddGalleryCheckoxColumnToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :gallery, :boolean
  end
end
