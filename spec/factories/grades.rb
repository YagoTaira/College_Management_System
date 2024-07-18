FactoryBot.define do
  # Define a factory for creating Grade objects
  factory :grade do
    # Associate each grade with an enrollment
    association :enrollment

    # Set a random score between 0 and 100 for the grade
    score { rand(0..100) }
  end
end