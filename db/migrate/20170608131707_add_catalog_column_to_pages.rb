class AddCatalogColumnToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :catalog, :boolean
  end
end
