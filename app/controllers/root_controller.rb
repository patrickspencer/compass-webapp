class RootController < ApplicationController
  def index
    @current_user = current_user
    if current_user.student?
      redirect_to student_welcome_url
    end
    if current_user.staff?
      redirect_to admin_welcome_url
    end
  end
end
