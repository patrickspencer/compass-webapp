require 'rails_helper'

RSpec.describe "student/problems/new", type: :view do
  before(:each) do
    assign(:student_problem, Student::Problem.new())
  end

  it "renders new student_problem form" do
    render

    assert_select "form[action=?][method=?]", student_problems_path, "post" do
    end
  end
end
