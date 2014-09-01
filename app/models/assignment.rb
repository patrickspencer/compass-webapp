class Assignment < ActiveRecord::Base
  has_many :assignment_problems
  has_many :problems, :through => :assignment_problems
end
