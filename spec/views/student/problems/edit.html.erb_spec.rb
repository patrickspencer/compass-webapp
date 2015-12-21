require 'rails_helper'

RSpec.describe "student/problems/edit", type: :view do
  before(:each) do
    @student_problem = assign(:student_problem, Student::Problem.create!())
  end

  it "renders the edit student_problem form" do
    render

    assert_select "form[action=?][method=?]", student_problem_path(@student_problem), "post" do
    end
  end
end
