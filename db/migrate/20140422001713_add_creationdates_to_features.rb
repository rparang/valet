class AddCreationdatesToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :launch_date_string, :string
    add_column :features, :launch_date, :datetime
  end
end
