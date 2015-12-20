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

    def edit
      @user = User.find(params[:id])
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to :controller => 'admin/users', :action => :index
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Created #{@user.first_name} #{@user.last_name}"
        redirect_to :controller => 'admin/users', :action => :index
      else
        render 'new'
      end
    end

    private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :id_string,
                                     :email, :password, :password_confirmation,
                                     :group_users_attributes => [:group_id])
      end

  end
end
