# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Attendance model
RSpec.describe Attendance, type: :model do
  # Test for valid attributes
  it "is valid with valid attributes" do
    attendance = create(:attendance)
    expect(attendance).to be_valid
  end

  # Test for invalid future date
  it "is not valid with a future date" do
    attendance = build(:attendance, date: Date.tomorrow)
    expect(attendance).not_to be_valid
    expect(attendance.errors[:date]).to include("cannot be in the future")
  end

  # Test for presence of status
  it "is not valid without a status" do
    attendance = build(:attendance, status: nil)
    expect(attendance).not_to be_valid
  end

  # Test for unique date per enrollment
  it "is not valid with a duplicate date" do
    enrollment = create(:enrollment)
    Attendance.create!(enrollment: enrollment, date: Date.new(2024, 5, 31), status: "Absent")
    duplicate_attendance_date = Attendance.new(enrollment: enrollment, date: Date.new(2024, 5, 31), status: "Present")
    expect(duplicate_attendance_date).not_to be_valid
    expect(duplicate_attendance_date.errors[:date]).to include("has already been registered for this student")
  end
end