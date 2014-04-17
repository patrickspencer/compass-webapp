# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

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
  ['Homework 1', 1],
  ['Homework 2', 1],
  ['Quiz 1', 2],
  ['Quiz 2', 2],
]
assignment_list.each do |name, type|
  Assignment.create( name: name, assignment_type_id: type)
end
