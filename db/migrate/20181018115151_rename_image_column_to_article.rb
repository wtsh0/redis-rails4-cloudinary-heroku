class RenameImageColumnToArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :image, :picture
  end
end
