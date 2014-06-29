module Admin
  class BaseController < ApplicationController
    # from https://github.com/ryanb/cancan/wiki/Admin-Namespace
    before_filter :verify_admin
    private
    def verify_admin
      redirect_to root_url unless current_user.group? "admin"
    end
  end
end
