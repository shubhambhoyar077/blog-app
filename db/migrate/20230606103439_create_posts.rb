class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :links_counter
      t.references :user, null: false, foreign_key: true, column: :author_id

      t.timestamps
    end
  end
end
