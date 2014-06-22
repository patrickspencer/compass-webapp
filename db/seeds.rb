# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create Groups
group_list = [
  "guest",
  "student",
  "ta",
  "instructor",
  "admin"
]
group_list.each do |name|
  Group.create(name: name)
end

# Create Users

User.create!({
  email: 'admin@admin.com',
  password: 'password',
  password_confirmation: 'password'
})
puts 'Created admin: admin@admin.com, password: password'

User.create({
  email: 'student@student.com',
  password: 'password',
  password_confirmation: 'password'
})
puts 'Created user: student@student.com, password: password'

date = DateTime.now

course_list = [
  ["College Algebra",date],
  ["Intermedita Algebra",date],
  ["Finite Mathematics",date],
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
  ['Quiz 2', 'quiz'],
]
assignment_list.each do |name, type|
  Assignment.create( name: name, assignment_type_id: type)
end

