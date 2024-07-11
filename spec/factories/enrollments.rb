FactoryBot.define do
  factory :enrollment do
    association :student
    association :course
    association :lecturer
  end
end