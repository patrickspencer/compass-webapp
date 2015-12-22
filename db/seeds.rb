# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'

# Create Groups
group_list = [
  "student",
  "ta",
  "instructor",
  "coordinator",
  "sysadmin" ]

group_list.each { |name|
  unless Group.exists?(:name => name)
    Group.create(:name => name)
    puts "Created group #{name}"
  end
}

# Create Users
admin_data = {
  email: 'leuler@gmail.com',
  id_string: 'leuler',
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
  id_string: 'jdoe',
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
  user_id: 1, # user leuler
  group_id: 3 # group id 3 is instructor
}
unless GroupUser.exists?(group_instructor_data)
  GroupUser.create(group_instructor_data)
  puts 'Assigned user Leonard Euler to instructor group'
end

group_student_data = {
  user_id: 2, # user jdoe
  group_id: 1 # group id 1 student
}

unless GroupUser.exists?(group_student_data)
  GroupUser.create(group_student_data)
  puts 'Assigned user John Doe to student group'
end

date = DateTime.now

course_list = [
  ["College Algebra",date],
  ["Intermediate Algebra",date]
]

course_list.each do |name,date|
  unless Course.exists?(:name => name)
    Course.create( name: name, start_datetime: date)
    puts "Create course #{name}"
  end
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

assignment_list = []
5.times do |n|
  assignment_data = {
    name: 'Quiz #{n}',
    assignment_type_id: 2,
    course_id: 1,
    max_problem_attempts: 3,
    start_datetime: DateTime.parse('3rd October 2015 06:35'),
    due_datetime: DateTime.parse('20th November 2014 05:00'),
    reduced_credit_due_datetime: DateTime.parse('21st November 2014 05:00')
  },
  unless Assignment.exists?(assignment_data)
    Assignment.find_or_create_by(assignment_data)
  end
end


# assignment_list.each do |assignment|
#   (1..10).each do |n|
#     prng = Random.new
#     problem_data = {
#       assignment_id: Assignment.where(name: assignment[:name])[0].id,
#       user_id: 2,
#       seed: prng.rand(1..100),
#       problem_template_id: 1,
#     }
#
#     unless Problem.exists?(problem_data)
#       prob = Problem.new(problem_data)
#       prob.save
#       puts "Created problem #{prob.id} and assigned it to #{assignment[:name]}"
#     end
#
#   end
# end

# assignment_user_data = {
#   assignment_id: 1,
#   user_id: 2, # user jdoe
# }
#
# AssignmentUser.find_or_create_by(assignment_user_data)
# puts 'Assigned user jdoe to assignment 1'

4.times do |n|
  major_topics = ['algebra','topology','calculus']
  minor_topics = ['straight lines','diff eqs','functions']
  problem_template_data = {
    value: "Problem Template #{n}",
    major_topic: major_topics[rand(major_topics.length)-1],
    minor_topic: minor_topics[rand(minor_topics.length)-1],
  }

  unless ProblemTemplate.exists?(problem_template_data)
    prob_template = ProblemTemplate.new(problem_template_data)
    prob_template.save
    puts "Created problem template #{prob_template.id}."
  end
end
