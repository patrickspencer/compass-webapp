# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  name           :string
#  start_datetime :datetime
#  end_datetime   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Course < ActiveRecord::Base
  has_many :course_users
  has_many :users, :through => :course_users
end
