# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Attendance system tests
RSpec.describe "Attendance", type: :system do
  # Set up test data before each test
  before do
    @student = create(:student, name: "Leandro")
    @course = create(:course, title: "Javascript 101")
    @enrollment = create(:enrollment, student: @student, course: @course)
  end

  # Test case: Creating a new attendance record
  it "creates a new attendance" do
    # Visit the new attendance page
    visit new_attendance_path

    # Fill in the form
    select @enrollment, from: "Enrollment"
    select "2024", from: "attendance_date_1i"
    select "July", from: "attendance_date_2i"
    select "11", from: "attendance_date_3i"
    select "Absent", from: "Status"

    # Submit the form
    click_on "Create Attendance"

    # Check for success message
    expect(page).to have_text("Attendance was successfully created.")

    # Verify the displayed information
    expect(page).to have_text("Leandro")
    expect(page).to have_text("Javascript 101")
    expect(page).to have_text("11/07/24")
    expect(page).to have_text("Absent")
  end
end