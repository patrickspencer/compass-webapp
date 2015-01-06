# == Schema Information
#
# Table name: assignments
#
#  id                          :integer          not null, primary key
#  name                        :string
#  assignment_type_id          :integer
#  course_id                   :integer
#  max_problem_attempts        :integer
#  start_datetime              :datetime
#  due_datetime                :datetime
#  reduced_credit_due_datetime :datetime
#

class Assignment < ActiveRecord::Base
  has_many :problems

  has_many :assignment_users
  has_many :users, :through => :assignment_users

  # return Array of hashes containing
  # information for each problem in assignment
  def self.get_assignment_problems(id)
    problems = Assignment.find(id).problems
    parray = Array.new
    problems.each { |p| parray << Problem.create_problem_hash(p) }
    return parray
  end

end
