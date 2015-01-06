class RootController < ApplicationController
  def index
    if current_user.student?
      redirect_to student_welcome_url
    elsif current_user.staff?
      redirect_to admin_welcome_url
    end
  end
end
