module Admin
  class BaseController < ApplicationController
    # from https://github.com/ryanb/cancan/wiki/Admin-Namespace
    layout "admin_base.html.erb"
    before_filter :verify_staff
    private
    def verify_staff
      redirect_to root_url unless current_user.staff?
    end
  end
end
