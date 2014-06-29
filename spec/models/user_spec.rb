require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.build_stubbed :user}

  describe '#assign_to_group' do
    it 'assigns user to given group' do
      user.assign_to_group :admin
      list = user.groups.map do |group|
        group.name.underscore.to_sym
      end
      expect(list.include?(:admin)).to eq true
    end
  end

  describe '#in_group?' do
    it 'returns true if user in group' do
    end
  end

  describe '#in_group?' do
    it 'returns true if user is in group' do
      user.groups <<  Group.where(name: 'student')
      expect(user.in_group? :student).to eq true
    end
  end

end
