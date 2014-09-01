class Problem < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  has_many :assignment_problems
  has_many :assignments, :through => :assignment_problems
end
