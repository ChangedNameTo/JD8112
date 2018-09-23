# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  team        :string           not null
#  description :string           not null
#  client      :string           not null
#  repo_link   :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :project do
    name        {Faker::Name.first_name}
    team        {Faker::Name.last_name}
    description {Faker::TheITCrowd.quote}
    client      {Faker::TheITCrowd.character}
    repo_link   {Faker::Internet.url}
  end
end
