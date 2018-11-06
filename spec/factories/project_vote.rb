FactoryBot.define do
  factory :project_vote do
    user
    project
    yes {Faker::Boolean.boolean}
  end
end
