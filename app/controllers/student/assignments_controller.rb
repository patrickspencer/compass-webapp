module Student
  class AssignmentsController < BaseController
    def index
      @assignments = Assignment.all()
    end
    def show
      @problems = Assignment.get_assignment_problems(params[:id])
    end
  end
end
