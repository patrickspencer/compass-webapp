require 'rails_helper'

RSpec.describe Group, :type => :model do

  it 'checks default groups exist' do
    list = Group.all.map do |g|
      g.name.underscore.to_sym
    end
    expect(list.include?(:sysadmin)).to be true
    expect(list.include?(:coordinator)).to be true
    expect(list.include?(:instructor)).to be true
    expect(list.include?(:ta)).to be true
    expect(list.include?(:student)).to be true

  end
end
