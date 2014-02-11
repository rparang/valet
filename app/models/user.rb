# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  email_display_name  :string(255)
#  email_formatted     :string(255)
#  bio                 :text
#  subscribed_to_email :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :bio, :email, :email_display_name, :email_formatted, :name, :subscribed_to_email

  has_many :relationships, :dependent => :destroy
  has_many :features, :through => :relationships

  def follow!(feature)
    relationships.create!(:feature_id => feature.id)
  end

  def following?(feature)
    rel = relationships.find_by_feature_id(feature.id)    
    return true if rel
  end

end

