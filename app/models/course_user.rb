class CourseUser < ActiveRecord::Base
  validates :course, presence: true
  validates :user, presence: true
  belongs_to :course
  belongs_to :user
end
