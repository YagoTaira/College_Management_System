FactoryBot.define do
  # Define a factory for creating Lecturer objects
  factory :lecturer do
    # Generate a random name for the lecturer using Faker
    name { Faker::Name.name }

    # Generate a random email for the lecturer using Faker
    email { Faker::Internet.email }
  end
end