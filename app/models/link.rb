# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  feature_id :integer
#  path       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  attr_accessible :feature_id, :name, :path

  belongs_to :feature

  validates :feature_id, :presence => true
end
