class AssignmentUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
end