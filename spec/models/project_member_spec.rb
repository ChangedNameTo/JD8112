require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe ProjectMember do
  it 'has a valid factory' do
    expect(build(:project_member)).to be_valid
  end
end
