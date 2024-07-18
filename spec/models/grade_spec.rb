# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Grade model
RSpec.describe Grade, type: :model do
  # Test case: Grade is valid with all required attributes
  it "is valid with valid attributes" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: 85)
    expect(grade).to be_valid
  end

  # Test case: Grade is invalid without a score
  it "is not valid without a score" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: nil)
    expect(grade).not_to be_valid
  end

  # Test case: Grade is invalid with a negative score
  it "is not valid with a score less than 0" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: -1)
    expect(grade).not_to be_valid
  end

  # Test case: Grade is invalid with a score above 100
  it "is not valid with a score greater than 100" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: 101)
    expect(grade).not_to be_valid
  end

  # Test case: Grade is invalid with a duplicate enrollment
  it "is not valid with a duplicate enrollment" do
    enrollment = create(:enrollment)
    Grade.create!(enrollment: enrollment, score: 90)
    duplicate_grade = Grade.new(enrollment: enrollment, score: 85)
    expect(duplicate_grade).not_to be_valid
  end
end