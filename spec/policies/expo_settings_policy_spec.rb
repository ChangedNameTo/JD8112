require 'rails_helper'

RSpec.describe ExpoSettingsPolicy do
  let(:user) { create(:user) }
  let(:sys_admin) { create(:user, :sys_admin) }
  let(:expo_admin) { create(:user, :expo_admin) }
  let(:team_member) { create(:user, :team_member) }
  let(:team_member2) { create(:user, :team_member) }

  subject { described_class }

  # System admins should be the only ones who can do anything.
  permissions :create?, :destroy?, :index?, :show?, :update? do
    it 'denies access if user is not a sys_admin or expo admin' do
      expect(subject).not_to permit(user)
      expect(subject).not_to permit(team_member)
    end

    it 'allows if the user is a sys admin or expo admin' do
      expect(subject).to permit(sys_admin)
      expect(subject).to permit(expo_admin)
    end
  end
end
