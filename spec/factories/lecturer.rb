FactoryBot.define do
  factory :lecturer do
      name { Faker::Name.name }
      email { Faker::Internet.email }
  end
end