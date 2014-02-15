class RemoveFeatureColumns < ActiveRecord::Migration
  def up
    remove_column :features, :attachments
    remove_column :features, :resources
    remove_column :features, :email_recipients
    remove_column :features, :stakeholders
  end

  def down
  end
end
