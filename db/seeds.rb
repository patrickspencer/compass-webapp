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

unless User.exists?(email: 'leuler@gmail.com')
  User.create(admin_data)
  puts 'Created user Leonard Euler; email:leuler@gmail.com, password: password'
end

student_data = {
  email: 'jdoe@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  first_name: 'John',
  last_name: 'Doe'
}

unless User.exists?(email: 'jdoe@gmail.com')
  User.create(student_data)
  puts 'Created user John Doe; email: jdoe@gmail.com, password: password'
end

group_instructor_data = {
  user_id: 1,
  group_id: 3 # group id 3 is instructor
}

unless GroupUser.exists?(user_id: 1)
  GroupUser.create(group_instructor_data)
  puts 'Assigned user Leonard Euler to instructor group'
end

group_student_data = {
  user_id: 2,
  group_id: 1 # group id 1 student
}

unless GroupUser.exists?(user_id: 2)
  GroupUser.create(group_student_data)
  puts 'Assigned user John Doe to student group'
end

date = DateTime.now

course_list = [
  ["College Algebra",date],
  ["Intermediate Algebra",date]
]

course_list.each do |name,date|
  Course.create( name: name, start_datetime: date)
end

leuler_id = User.where(email: "leuler@gmail.com")[0].id
jdoe_id = User.where(email: "jdoe@gmail.com")[0].id
ca_course_id = Course.where(name: "College Algebra")[0].id
ia_course_id = Course.where(name: "Intermediate Algebra")[0].id

course_user_map_1 = {
  course_id: ca_course_id,
  user_id: jdoe_id
}

unless CourseUser.exists?(course_user_map_1)
  CourseUser.create(course_user_map_1)
  puts 'Assigned User John Doe to College Algebra Course'
end

course_user_map_2 = {
  course_id: ca_course_id,
  user_id: leuler_id
}

unless CourseUser.exists?(course_user_map_2)
  CourseUser.create(course_user_map_2)
  puts 'Assigned User Leonard Euler to College Algebra Course'
end

course_user_map_3 = {
  course_id: ia_course_id,
  user_id: leuler_id
}

unless CourseUser.exists?(course_user_map_3)
  CourseUser.create(course_user_map_3)
  puts 'Assigned User Leonard Euler to Intermediate Algebra Course'
end

assignment_type_list = ['homework','quiz']
assignment_type_list.each do |type|
  AssignmentType.create(name: type)
end

# the first number is the assignment type. 1 = hw, 2 = quiz
# the second number refers to the course id. 1 = College Algebra
# 2 = Intermediate Algebra
assignment_list = [
  ['Homework 1', 1, 1],
  ['Homework 2', 1, 1],
  ['Quiz 1', 2, 1]
]

assignment_list.each do |name, type, course_id|
  Assignment.create( name: name, assignment_type_id: type, course_id: course_id)
end

assignment_list.each do |name,type|
  (1..10).each do |n|

    prob_data = {
      value: "Assignment \"#{name}\", Prob. value #{n}",
    }

    p = Problem.new(prob_data)
    p.save!

    problem_data = {
      problem_id: p.id,
      assignment_id: Assignment.where(name: name)[0].id
    }

    unless AssignmentProblem.exists?(problem_data)
      AssignmentProblem.create(problem_data)
      puts "Created problem #{p.id} and assigned it to #{name}"
    end
  end
end
