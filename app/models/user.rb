class User < ActiveRecord::Base

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, :through => :group_users

  has_many :assignments
  has_many :problems, :through => :assignments

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
