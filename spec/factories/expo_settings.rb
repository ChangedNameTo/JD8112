FactoryBot.define do
  factory :expo_setting do
    voting_enabled {Faker::Name.first_name}
  end
end
