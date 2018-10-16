class AddColumnImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :image, :string, after: :title
  end
end
