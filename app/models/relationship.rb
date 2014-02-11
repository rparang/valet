# == Schema Information
#
# Table name: relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  feature_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :feature_id, :user_id

  belongs_to :user
  belongs_to :feature

  validates :user_id, :presence => true
  validates :feature_id, :presence => true

end
