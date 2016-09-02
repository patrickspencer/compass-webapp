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
      @answer = Answer.new
      @all_answers = Answer.where(:user_id => current_user.id,\
                                  :problem_id => params[:id])
    end

  end
end
