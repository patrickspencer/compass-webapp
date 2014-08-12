require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.build_stubbed :user}
  let(:user2) {FactoryGirl.build_stubbed :user}

  describe '#assign_to_group' do
    it 'assigns user to given group' do
      user.assign_to_group :sysadmin
      list = user.groups.map do |group|
        group.name.underscore.to_sym
      end
      expect(list.include?(:sysadmin)).to eq true
    end
  end

  describe '#list_groups' do
    it 'returns array of groups to whom user belongs' do
      user.assign_to_group :sysadmin
      user.assign_to_group :instructor
      list = user.groups.map do |group|
        group.name.underscore.to_sym
      end
      expect(list.include?(:sysadmin)).to eq true
      expect(list.include?(:instructor)).to eq true
    end
  end

  describe '#in_group?' do
    it 'returns true if user in group' do
      user.assign_to_group :sysadmin
      expect(user.in_group?(:sysadmin)).to eq true
      expect(user.in_group?(:instructor)).to eq false
    end
  end

  describe '#staff?' do
    it 'returns true if user in group
    sysadmin, coordinator, instructor, or ta' do
      user.assign_to_group :sysadmin
      user2.assign_to_group :student
      expect(user.staff?).to eq true
      expect(user2.staff?).to eq false
    end
  end

  describe '#student?' do
    it 'returns true if user in group' do
      user.assign_to_group :student
      user2.assign_to_group :instructor
      expect(user.student?).to eq true
      expect(user2.student?).to eq false
    end
  end

end
