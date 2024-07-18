# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Student model
RSpec.describe Student, type: :model do
  # Test case: Student is valid with all required attributes
  it "is valid with valid attributes" do
    student = build(:student)
    expect(student).to be_valid
  end

  # Test case: Student is invalid without a name
  it "is not valid without a name" do
    student = build(:student, name: nil)
    expect(student).to_not be_valid
  end

  # Test case: Student is invalid without an email
  it "is not valid without an email" do
    student = build(:student, email: nil)
    expect(student).to_not be_valid
  end

  # Test case: Student is invalid with a duplicate email
  it "is not valid with a duplicate email" do
    create(:student, email: "test@example.com")
    student = build(:student, email: "test@example.com")
    expect(student).to_not be_valid
  end

  # Test case: Student is invalid without an age
  it "is not valid without an age" do
    student = build(:student, age: nil)
    expect(student).to_not be_valid
  end

  # Test case: Student is invalid with a negative age
  it "is not valid with a negative age" do
    student = build(:student, age: -1)
    expect(student).to_not be_valid
  end
end