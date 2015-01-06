module Student
  class AssignmentsController < BaseController
    def index
      user = current_user
      @assignments = user.assignments
    end
    def show
      @problems = Assignment.get_assignment_problems(params[:id])
    end
  end
end
