# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  id_string              :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#

class User < ActiveRecord::Base

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:id_string]

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :id_string, :presence => true

  has_many :group_users
  has_many :groups, :through => :group_users
  accepts_nested_attributes_for :group_users, :reject_if => :all_blank

  has_many :assignment_problems
  has_many :problems, :through => :assignment_problems

  has_many :course_users
  has_many :courses, :through => :course_users

  has_many :assignment_users
  has_many :assignments, :through => :assignment_users

  def assign_to_group(group)
    self.groups << Group.where(name: group.to_s)
  end

  def list_groups
    self.groups.map {|group| group.name.underscore.to_sym}
  end

  def in_group?(group)
    !!self.groups.find_by_name(group.to_s)
  end

  def staff?
    staff_groups = [:sysadmin,:coordinator,:instructor,:ta]
    staff_groups.any? {|g| self.list_groups.include?(g) }
  end

  def student?
    self.list_groups.include?(:student)
  end

end
