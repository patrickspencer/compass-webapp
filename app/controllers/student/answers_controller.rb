class Student::AnswersController < ApplicationController
    def create
      @answer = Answer.new({
        :user_id => current_user.id,
        :problem_id => answer_params[:problem_id],
        :value => answer_params[:value]
      })
      if @answer.save
        redirect_to :controller => 'student/problems', :action => :show,\
          :id => params[:answer][:problem_id].to_i
      else
        render 'new'
      end
    end

    private

      def answer_params
        params.require(:answer).permit(:problem_id, :value)
      end

end
