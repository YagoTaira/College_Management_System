FactoryBot.define do
  # Define a factory for creating Attendance objects
  factory :attendance do
    # Associate each attendance with an enrollment
    association :enrollment

    # Set a default date for the attendance
    date { Date.new(2024, 7, 11) }

    # Set a default status for the attendance
    status { "Present" }
  end
end