require 'rails_helper'

RSpec.describe "student/problems/show", type: :view do
  before(:each) do
    @student_problem = assign(:student_problem, Student::Problem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
