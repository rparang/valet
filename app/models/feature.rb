# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  code        :string(255)
#

class Feature < ActiveRecord::Base
  attr_accessible :description, :title, :code

  has_many :relationships, :dependent => :destroy
  has_many :users, :through => :relationships
  has_many :attachments, :dependent => :destroy
  has_many :links, :dependent => :destroy

  validates :code, :presence => true, :uniqueness => true
  
end
