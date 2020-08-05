class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |t|
      t.integer :blog_id
      t.string :headline
      t.text :body_text
    end
  end
end
