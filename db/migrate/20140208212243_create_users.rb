class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :email_display_name
      t.string :email_formatted
      t.text :bio
      t.boolean :subscribed_to_email, :default => true

      t.timestamps
    end
  end
end
