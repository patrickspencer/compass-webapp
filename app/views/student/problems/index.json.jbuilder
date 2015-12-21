json.array!(@student_problems) do |student_problem|
  json.extract! student_problem, :id
  json.url student_problem_url(student_problem, format: :json)
end
