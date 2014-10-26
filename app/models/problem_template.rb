class ProblemTemplate < ActiveRecord::Base
  belongs_to :problem
  has_many :problems
end
