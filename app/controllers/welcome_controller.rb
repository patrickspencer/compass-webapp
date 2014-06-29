class WelcomeController < ApplicationController
  def index
    @c_user = current_user.email
    @check = current_user.group? "admin"
  end
end
