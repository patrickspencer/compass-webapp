module Admin
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to Compass!"
        redirect_to controller: 'user', action: 'index'
      else
        render 'new'
      end
    end

    private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :id_string,
                                     :email, :password, :password_confirmation)
      end

  end
end
