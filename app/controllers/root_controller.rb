class RootController < ApplicationController
  def index
    @current_user = current_user
    if current_user.student?
      render "student/dashboard/index"
    end
    if current_user.staff?
      redirect_to admin_url
    end
  end
end
