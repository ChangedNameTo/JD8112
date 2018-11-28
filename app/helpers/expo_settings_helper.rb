module ExpoSettingsHelper
  def isVotingEnabled?
    ExpoSettings.first.voting_enabled
  end
end