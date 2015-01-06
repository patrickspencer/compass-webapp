# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  has_many :group_users
  has_many :users, :through => :group_users
end
