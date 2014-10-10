module Student
  class AssignmentsController < BaseController
    def index
      @assignments = Assignment.all()
    end
    def show
      @assignment = Assignment.find(params[:id])
      @problems = Assignment.find(params[:id]).problems
    end
  end
end
