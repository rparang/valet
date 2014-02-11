# == Schema Information
#
# Table name: features
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  description      :text
#  attachments      :text
#  stakeholders     :text
#  email_recipients :text
#  resources        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Feature < ActiveRecord::Base
  attr_accessible :attachments, :description, :email_recipients, :resources, :stakeholders, :title

  serialize :email_recipients
  serialize :resources
  serialize :stakeholders
  serialize :attachments

  has_many :relationships, :dependent => :destroy
  has_many :users, :through => :relationships
  
end
