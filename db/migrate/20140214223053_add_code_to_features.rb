class AddCodeToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :code, :string
  end
end
