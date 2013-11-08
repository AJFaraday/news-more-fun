class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :url
      t.string :body_xpath
  
      t.timestamps
    end
  end
end
