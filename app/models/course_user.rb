# == Schema Information
#
# Table name: course_users
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class CourseUser < ActiveRecord::Base
  validates :course, presence: true
  validates :user, presence: true
  belongs_to :course
  belongs_to :user
end
