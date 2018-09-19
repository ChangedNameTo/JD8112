require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe UserRole do
  subject { build(:user_role) }

  it {should be_valid}
  it {should validate_presence_of :role_id }
  it {should validate_presence_of :user_id }

  it {should belong_to :user}
  it {should belong_to :role}

  describe 'role', field: :role do
    it "is invalid without a unique role per user" do
      user_role = create(:user_role)

      expect(build(:user_role, role: user_role.role, user: user_role.user)).not_to be_valid
    end

    it_behaves_like 'non null field'
  end
end
