class Users:RegistrationsController < Devise::RegistrationsController
  def new
    @users = User.new
  end
end
