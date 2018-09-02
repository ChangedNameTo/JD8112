require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'provider', field: :provider do
    it_behaves_like 'non null field'
  end

  describe 'UID', field: :uid do
    it_behaves_like 'non null field'

    it "not valid wihout a unique UID per provider" do
      first_user = create(:user, provider: "Test", uid: "test")
      expect(build(:user, uid: "test", provider: "Test")).not_to be_valid
    end

    it "is valid without a unique UID between multiple providers" do
      first_user = create(:user, provider: "Test", uid: "test")
      expect(build(:user, uid: "test", provider: "Best")).to be_valid
    end
  end

    describe 'first name', field: :first_name do
    it_behaves_like 'non null field'
  end

  describe 'last name', field: :last_name do
    it_behaves_like 'non null field'
  end

	describe 'oauth expiration date', field: :oauth_expires_at do
    it_behaves_like 'non null field'
  end

	describe 'email_address', field: :email_address do
    it_behaves_like 'non null field'

    it "is invalid without an email" do
      expect(build(:user, email_address: nil )).not_to be_valid
    end
  end

  describe "#full_name" do
    it "returns the user's full name as a string" do
      user = build(:user,
        first_name: "Will",
        last_name: "Mitchell"
      )

      expect(user.full_name).to eq "Will Mitchell"
    end
  end
end
