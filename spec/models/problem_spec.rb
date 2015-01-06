# == Schema Information
#
# Table name: problems
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  assignment_id       :integer
#  value               :string
#  seed                :integer
#  grade               :string
#  attempts            :string
#  created_at          :datetime
#  updated_at          :datetime
#  problem_template_id :integer
#

require 'rails_helper'

RSpec.describe Problem, :type => :model do

end

