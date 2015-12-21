require 'rails_helper'

RSpec.describe "Student::Problems", type: :request do
  describe "GET /student_problems" do
    it "works! (now write some real specs)" do
      get student_problems_path
      expect(response).to have_http_status(200)
    end
  end
end
