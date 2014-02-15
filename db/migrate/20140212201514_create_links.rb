class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.integer :feature_id
      t.string :path

      t.timestamps
    end
  end
end
