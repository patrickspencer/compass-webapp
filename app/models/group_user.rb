# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class GroupUser < ActiveRecord::Base
  validates :user_id, presence: true
  validates :group_id, presence: true
  belongs_to :group
  belongs_to :user
  accepts_nested_attributes_for :group
end
