class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :headline
      t.text :body
      t.integer :source_id
      t.string :rss_link
      t.integer :sub_count

      t.timestamps
    end
  end
end
