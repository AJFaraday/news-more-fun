class CreateSubstitutions < ActiveRecord::Migration
  def change
    create_table :substitutions do |t|
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
