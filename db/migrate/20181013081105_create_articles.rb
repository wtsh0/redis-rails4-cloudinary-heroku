class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :details
      t.boolean :published
      t.date :published_at
      t.integer :week_pv
      t.integer :monthly_pv
      t.integer :total_pv

      t.timestamps null: false
    end
  end
end
