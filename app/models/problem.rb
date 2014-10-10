class Problem < ActiveRecord::Base
  has_many :assignment_problems
  has_many :assignments, :through => :assignment_problems
end
