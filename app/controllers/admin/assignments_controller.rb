module Admin
  class AssignmentsController < BaseController
    def index
      @assignments = Assignment.all
    end

    def show
      @assignment = Assignment.find(params[:id])
    end

    def new
      @assignment = Assignment.new
    end

    def edit
      @assignment = Assignment.find(params[:id])
    end

    def destroy
      Assignment.find(params[:id]).destroy
      flash[:success] = "Assignment deleted"
      redirect_to :controller => 'admin/assignments', :action => :index
    end

    def create
      @assignment = Assignment.new(assignment_params)
      if @assignment.save
        flash[:success] = "Created #{@assignment.name}"
        redirect_to :controller => 'admin/assignments', :action => :index
      else
        render 'new'
      end
    end

    private

      def assignment_params
        params.require(:assignment).permit(:name, :start_date, :end_date)
      end

  end
end
