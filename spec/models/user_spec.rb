require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.build :user}
  let(:user2) {FactoryGirl.build :user}

  describe '#assign_to_group' do
    it 'assigns user to given group' do
      user.assign_to_group :sysadmin
      list = user.groups.map do |group|
        group.name.underscore.to_sym
      end
      expect(list.include?(:sysadmin)).to be true
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
      user.assign_to_group :coordinator
      user.assign_to_group :instructor
      user.assign_to_group :ta
      user.assign_to_group :student
      expect(user.in_group?(:sysadmin)).to eq true
      expect(user.in_group?(:coordinator)).to eq true
      expect(user.in_group?(:instructor)).to eq true
      expect(user.in_group?(:ta)).to eq true
      expect(user.in_group?(:student)).to eq true
    end
  end

  describe '#staff?' do
    it 'returns true if user in group sysadmin' do
      user.assign_to_group :sysadmin
      expect(user.staff?).to eq true
    end
  end

  describe '#staff?' do
    it 'returns true if user in group coordinator' do
      user.assign_to_group :coordinator
      expect(user.staff?).to eq true
    end
  end

  describe '#staff?' do
    it 'returns true if user in group
    instructor' do
      user.assign_to_group :instructor
      expect(user.staff?).to eq true
    end
  end

  describe '#staff?' do
    it 'returns true if user in group
    ta' do
      user.assign_to_group :ta
      expect(user.staff?).to eq true
    end
  end

  describe '#student?' do
    it 'returns true if user in student group' do
      user.assign_to_group :student
      expect(user.student?).to eq true
    end
  end

end
