# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  label       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :role do
    sequence :label do |n|
      "Role #{n}"
    end

    description {Faker::Lorem.sentence}
  end
end
