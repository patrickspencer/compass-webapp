# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create Groups
group_list = [
  "student",
  "ta",
  "instructor",
  "coordinator"
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
group_list.each do |name|
  Group.create(name: name)
end

# Create Users
admin_data = {
  email: 'admin@admin.com',
  password: 'password',
  password_confirmation: 'password'
}
User.where(email: 'admin@admin.comUser').exists? || User.create(admin_data)
puts 'Created admin: admin@admin.com, password: password'

student_data = {
  email: 'student@student.com',
  password: 'password',
  password_confirmation: 'password'
}

User.where(email: 'student@student.com').exists? || User.create(student_data)
puts 'Created user: student@student.com, password: password'

group_admin_data = {
  user_id: 1,
  group_id: 5
}
GroupUser.where(user_id: 1).exists? || GroupUser.create(group_admin_data)

group_student_data = {
  user_id: 2,
  group_id: 2
}
GroupUser.where(user_id: 2).exists? || GroupUser.create(group_student_data)
#
# date = DateTime.now
#
# course_list = [
#   ["College Algebra",date],
#   ["Intermedita Algebra",date],
#   ["Finite Mathematics",date],
# ]
# course_list.each do |name,date|
#   Course.create( name: name, start_datetime: date)
# end
#
# assignment_type_list = ['homework','quiz']
# assignment_type_list.each do |type|
#   AssignmentType.create( name: type)
# end
#
# assignment_list = [
#   ['Homework 1', 'homework'],
#   ['Homework 2', 'homework'],
#   ['Quiz 1', 'quiz'],
#   ['Quiz 2', 'quiz'],
# ]
# assignment_list.each do |name, type|
#   Assignment.create( name: name, assignment_type_id: type)
# end
#
# assignment_list = [
#   ['Homework 1', 'homework'],
#   ['Homework 2', 'homework'],
#   ['Quiz 1', 'quiz'],
#   ['Quiz 2', 'quiz'],
# ]
# assignment_list.each do |name, type|
#   Assignment.create( name: name, assignment_type_id: type)
# end
