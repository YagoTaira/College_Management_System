FactoryBot.define do
    # Define a factory for creating Student objects
    factory :student do
      # Generate a random name for the student using Faker
      name { Faker::Name.name }
  
      # Generate a random email for the student using Faker
      email { Faker::Internet.email }
  
      # Generate a random age for the student between 18 and 65 using Faker
      age { Faker::Number.between(from: 18, to: 65) }
    end
  end