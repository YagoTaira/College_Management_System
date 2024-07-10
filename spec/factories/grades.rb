FactoryBot.define do
  factory :grade do
    association :enrollment
    score { rand(0..100) }
  end
end