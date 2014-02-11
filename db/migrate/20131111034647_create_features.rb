class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :description
      t.text :attachments
      t.text :stakeholders
      t.text :email_recipients
      t.text :resources

      t.timestamps
    end
  end
end
