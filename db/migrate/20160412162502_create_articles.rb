class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :image_url
      t.string :title
      t.string :url

      t.timestamps null: false
    end
  end
end
