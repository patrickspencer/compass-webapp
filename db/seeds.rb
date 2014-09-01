# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create Groups
group_list = [
  "student",
  "ta",
  "instructor",
  "coordinator",
  "sysadmin" ]

group_list.each { |name| Group.create(name: name) }

# Create Users
admin_data = {
  email: 'leuler@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'Leonard',
  last_name: 'Euler'
}

User.exists?(email: 'leuler@gmail.com') || User.create(admin_data)
puts 'Created user Leonard Euler; email:leuler@gmail.com, password: password'

student_data = {
  email: 'jdoe@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'John',
  last_name: 'Doe'
}

User.exists?(email: 'jdoe@gmail.com') || User.create(student_data)
puts 'Created user John Doe; email: jdoe@gmail.com, password: password'

group_instructor_data = {
  user_id: 1,
  group_id: 3 # group id 3 is instructor
}

GroupUser.exists?(user_id: 1) || GroupUser.create(group_instructor_data)
puts 'Assigned user \'Leonard Euler\' to \'instructor\' group'

group_student_data = {
  user_id: 2,
  group_id: 1 # group id 1 student
}

GroupUser.exists?(user_id: 2) || GroupUser.create(group_student_data)
puts 'Assigned user \'John Doe\' to \'student\' group'

date = DateTime.now

course_list = [
  ["College Algebra",date],
  ["Intermedita Algebra",date]
]

course_list.each do |name,date|
  Course.create( name: name, start_datetime: date)
end

assignment_type_list = ['homework','quiz']
assignment_type_list.each do |type|
  AssignmentType.create( name: type)
end

assignment_list = [
  ['Homework 1', 'homework'],
  ['Homework 2', 'homework'],
  ['Quiz 1', 'quiz'],
]

assignment_list.each do |name, type|
  Assignment.create( name: name, assignment_type_id: type)
end

assignment_list.each do |name,type|
  (1..10).each do |n|

    prob_data = {
      :value => "Assignment \"#{name}\", Prob. value #{n}"
    }

    p = Problem.new(prob_data)
    p.save!

    problem_data = {
      :problem_id => p.id,
      :assignment_id => Assignment.where(name: name)[0].id
    }

    unless AssignmentProblem.exists?(problem_data)
      AssignmentProblem.create(problem_data)
      puts "Created problem #{p.id} and assigned it to #{name}"
    end
  end
end
