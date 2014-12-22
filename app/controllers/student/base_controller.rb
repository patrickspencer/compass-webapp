module Student
  class BaseController < ApplicationController
    layout "student_base.html.erb"
    before_filter :verify_student
    private
    def index

    end
    def verify_student
      redirect_to root_url unless current_user.student?
    end
  end
end
