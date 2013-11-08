class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :headline
      t.text :body
      t.integer :source_id
      t.string :hash

      t.timestamps
    end
  end
end
