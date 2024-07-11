FactoryBot.define do
  factory :attendance do
    association :enrollment
    date { Date.new(2024, 7, 11) }
    status { "Present" }
  end
end