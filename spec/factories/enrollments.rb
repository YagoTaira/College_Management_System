FactoryBot.define do
  factory :enrollment do
    association :student
    association :course
  end
end