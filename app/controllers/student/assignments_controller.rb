module Student
  class AssignmentsController < BaseController
    def index
      @assignments = current_user.assignments
    end
    def show
      @problems = Assignment.get_assignment_problems(params[:id])
    end
  end
end
