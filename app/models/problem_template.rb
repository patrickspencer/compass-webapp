# == Schema Information
#
# Table name: problem_templates
#
#  id          :integer          not null, primary key
#  value       :string
#  major_topic :string
#  minor_topic :string
#  tags        :string
#  created_at  :datetime
#  updated_at  :datetime
#

class ProblemTemplate < ActiveRecord::Base
  belongs_to :problem
  has_many :problems

  def self.parse_value(template)
    require 'open3'
    i, o, e, t = Open3.popen3("perl -e \'#{template.value}\'")
    {input: i, output: o, error: e, thread: t}
  end

end
