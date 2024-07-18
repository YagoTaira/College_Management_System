FactoryBot.define do
  # Define a factory for creating Enrollment objects
  factory :enrollment do
    # Associate each enrollment with a student
    association :student

    # Associate each enrollment with a course
    association :course

    # Associate each enrollment with a lecturer
    association :lecturer
  end
end