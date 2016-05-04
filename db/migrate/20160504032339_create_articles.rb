class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :tag
      t.integer :readcount
      t.boolean :original
      t.string :user_email
      t.string :remark

      t.timestamps null: false
    end
  end
end
