# == Schema Information
#
# Table name: expo_settings
#
#  id             :integer          not null, primary key
#  voting_enabled :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :expo_setting do
    voting_enabled {Faker::Name.first_name}
  end
end
