class AssignmentsController < ApplicationController
  def show
    @assignments = Assignment.all()
  end
end
