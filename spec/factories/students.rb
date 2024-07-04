FactoryBot.define do
    factory :student do
        name { Faker::Name.name }
        email { Faker::Internet.email }
        age { Faker::Number.between(from: 18, to: 65) } # generates random numbers between 18 and 65
    end
end