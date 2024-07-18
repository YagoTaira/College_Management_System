# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Enrollment model
RSpec.describe Enrollment, type: :model do
  # Create test instances using FactoryBot
  let(:student) { FactoryBot.create(:student) }
  let(:course) { FactoryBot.create(:course) }
  let(:lecturer) { FactoryBot.create(:lecturer) }

  # Test case: Enrollment is valid with all required attributes
  it "is valid with valid attributes" do
    enrollment = Enrollment.new(student: student, course: course, lecturer: lecturer)
    expect(enrollment).to be_valid
  end

  # Test case: Enrollment is invalid without a student
  it "is not valid without a student" do
    enrollment = Enrollment.new(course: course, lecturer: lecturer)
    expect(enrollment).to_not be_valid
  end

  # Test case: Enrollment is invalid without a course
  it "is not valid without a course" do
    enrollment = Enrollment.new(student: student, lecturer: lecturer)
    expect(enrollment).to_not be_valid
  end

  # Test case: Enrollment is invalid without a lecturer
  it "is not valid without a lecturer" do
    enrollment = Enrollment.new(student: student, course: course)
    expect(enrollment).to_not be_valid
  end

  # Test case: Enrollment is invalid with a duplicate student and course combination
  it "is not valid with a duplicate student and course combination" do
    Enrollment.create(student: student, course: course, lecturer: lecturer)
    duplicate_enrollment = Enrollment.new(student: student, course: course, lecturer: lecturer)
    expect(duplicate_enrollment).not_to be_valid
    expect(duplicate_enrollment.errors[:student_id]).to include("is already enrolled in this course")
  end
end