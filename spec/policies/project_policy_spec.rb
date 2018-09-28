require 'rails_helper'

RSpec.describe ProjectPolicy do
  let(:user) { create(:user) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:expo_admin) { create(:user, :expo_admin) }
  let(:team_member) { create(:user, :team_member) }
  let(:team_member2) { create(:user, :team_member) }

  subject { described_class }

  # System admins should be the only ones who can do anything.
  permissions :create?, :destroy? do
    it 'denies access if user is not a sys_admin or expo admin' do
      expect(subject).not_to permit(user)
      expect(subject).not_to permit(team_member)
    end

    it 'allows if the user is a sys admin' do
      expect(subject).to permit(sys_admin)
      expect(subject).to permit(expo_admin)
    end
  end

  permissions :edit? do
    it 'denies access if user is not a team member of that project' do
      expect(subject).not_to permit(team_member, team_member2)
    end

    it 'denies access if user is a regular user' do
      expect(subject).not_to permit(team_member, team_member2)
    end

    it 'allows if the user is a sys admin or expo admin' do
      expect(subject).to permit(sys_admin)
      expect(subject).to permit(expo_admin)
    end
  end

  permissions :show? do
    it 'denies access if user is not a sys_admin or expo admin' do
    end

    it 'allows all' do
      expect(subject).to permit(user)
      expect(subject).to permit(team_member)
      expect(subject).to permit(sys_admin)
      expect(subject).to permit(expo_admin)
    end
  end
end
