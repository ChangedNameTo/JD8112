# == Schema Information
#
# Table name: expo_settings
#
#  id             :integer          not null, primary key
#  voting_enabled :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ExpoSettings < ApplicationRecord
end
