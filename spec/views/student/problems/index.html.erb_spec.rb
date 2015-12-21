require 'rails_helper'

RSpec.describe "student/problems/index", type: :view do
  before(:each) do
    assign(:student_problems, [
      Student::Problem.create!(),
      Student::Problem.create!()
    ])
  end

  it "renders a list of student/problems" do
    render
  end
end
