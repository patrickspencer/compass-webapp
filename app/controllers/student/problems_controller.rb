module Student
  class ProblemsController < BaseController
    # before_action :set_problem, only: [:show]

    # GET /student/problems
    # GET /student/problems.json
    def index
      @problems = Problem.all
    end

    # GET /student/problems/1
    # GET /student/problems/1.json
    def show
      @problem = Problem.find(params[:id])
    end

  end
end
