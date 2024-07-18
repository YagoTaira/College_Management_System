FactoryBot.define do
  # Define a factory for creating Course objects
  factory :course do
    # Set a default title for the course
    title { "Introduction to Programming" }

    # Set a default description for the course
    description { "A comprehensive course on the basics of programming." }
  end
end