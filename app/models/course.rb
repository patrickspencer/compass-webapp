class Course < ActiveRecord::Base
  has_many :course_users
  has_many :users, :through => :course_users
end
