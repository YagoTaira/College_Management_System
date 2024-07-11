require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it "is valid with valid attributes" do
    attendance = create(:attendance)
    expect(attendance).to be_valid
  end

  it "is not valid with a future date" do
    attendance = build(:attendance, date: Date.tomorrow)
    expect(attendance).not_to be_valid
    expect(attendance.errors[:date]).to include("cannot be in the future")
  end

  it "is not valid without a status" do
    attendance = build(:attendance, status: nil)
    expect(attendance).not_to be_valid
  end

  it "is not valid with a duplicate date" do
    enrollment = create(:enrollment)
    Attendance.create!(enrollment: enrollment, date: Date.new(2024, 5, 31), status: "Absent")
    duplicate_attendance_date = Attendance.new(enrollment: enrollment, date: Date.new(2024, 5, 31), status: "Present")
    expect(duplicate_attendance_date).not_to be_valid
    expect(duplicate_attendance_date.errors[:date]).to include("is already registered")
  end
end