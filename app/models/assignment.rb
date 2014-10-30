class Assignment < ActiveRecord::Base
  has_many :problems

  # return Array of hashes containing
  # information for each problem in assignment
  def self.get_assignment_problems(id)
    problems = Assignment.find(id).problems
    parray = Array.new
    problems.each { |p| parray << Problem.create_problem_hash(p) }
    return parray
  end

end
