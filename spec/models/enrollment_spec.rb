require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  it "is valid with valid attributes" do
    student = FactoryBot.create(:student)
    course = FactoryBot.create(:course)
    enrollment = Enrollment.new(student: student, course: course)
    expect(enrollment).to be_valid
  end

  it "is not valid without a student" do
    course = FactoryBot.create(:course)
    enrollment = Enrollment.new(course: course)
    expect(enrollment).to_not be_valid
  end

  it "is not valid without a course" do
    student = FactoryBot.create(:student)
    enrollment = Enrollment.new(student: student)
    expect(enrollment).to_not be_valid
  end

  it "is not valid with a duplicate student and course combination" do
    student = FactoryBot.create(:student)
    course = FactoryBot.create(:course)
    Enrollment.create(student: student, course: course)
    duplicate_enrollment = Enrollment.new(student: student, course: course)
    expect(duplicate_enrollment).not_to be_valid
    expect(duplicate_enrollment.errors[:student_id]).to include("is already enrolled in this course")
  end
end