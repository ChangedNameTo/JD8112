require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
