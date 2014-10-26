module Student
  class AssignmentsController < BaseController
    def index
      @assignments = Assignment.all()
    end
    def show
      @assignment = Assignment.find(params[:id])
      @problems = Assignment.find(params[:id]).problems
      @problems.each do |problem|
        template_hash = {
          problem: problem,
          template: problem.problem_template,
        }
        @problem_hash = Array.new
        @problem_hash << template_hash
      end
    end
  end
end
