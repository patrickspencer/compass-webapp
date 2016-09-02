class Admin::ProblemTemplatesController < ApplicationController

  def index
    @problem_template = ProblemTemplate.all
  end

  def new
    @user = User.new
  end

end
