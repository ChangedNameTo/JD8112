FactoryBot.define do
  factory :project_comment do
    user
    project
    body {Faker::Lorem.sentence}
  end
end
