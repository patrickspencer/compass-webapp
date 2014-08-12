class WelcomeController < ApplicationController
  def index
    @current_user = current_user
    @check_staff = current_user.staff?
  end
end
