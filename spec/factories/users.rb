# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string
#  image            :string
#  enabled          :boolean          default(FALSE), not null
#  email_address    :string           not null
#  provider         :string           not null
#  uid              :string           not null
#  oauth_token      :string           not null
#  oauth_expires_at :datetime         not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :user do
    first_name       {Faker::Name.first_name}
    last_name        {Faker::Name.last_name}
    email_address    {Faker::Internet.email}
    image            {Faker::Lorem.word}
    provider         {Faker::Lorem.word}
    uid              {Faker::Lorem.characters(10)}
    oauth_token      {Faker::Lorem.characters(10)}
    oauth_expires_at {Faker::Time.between(DateTime.now, DateTime.now + 12.days)}

    trait :sys_admin do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'System Admin')
        )
      end
    end

    trait :expo_admin do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Expo Admin')
        )
      end
    end

    trait :team_member do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Team Member')
        )
      end
    end
  end
end
