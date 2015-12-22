class Admin::ProblemTemplatesController < ApplicationController
  def index
    @problem_template = ProblemTemplate.all
  end
end
