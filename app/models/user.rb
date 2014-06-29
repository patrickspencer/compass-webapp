class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :group_users
  has_many :groups, :through => :group_users

  def assign_to_group(group)
    self.groups << Group.where(name: group.to_s)
  end

  def list_groups
    self.groups.map {|group| group.name.underscore.to_sym}
  end

  def in_group?(group)
    !!self.groups.find_by_name(group.to_s)
  end

  def admin?
    self.list_groups.include?(:coordinator || :instructor || :ta)
  end

  def student?
    self.list_groups.include?(:student)
  end


end
