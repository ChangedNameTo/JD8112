require 'rails_helper'

describe Role do
  subject { build(:role) }

  it {should be_valid}
  it {should validate_presence_of :label }
  it {should validate_presence_of :description }

  it {should have_many :user_roles}

  it "is invalid without a unique label" do
    role = create(:role)

    expect(build(:role, label: role.label)).not_to be_valid
  end
end
