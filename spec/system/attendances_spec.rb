require 'rails_helper'

RSpec.describe "Attendance", type: :system do
  before do
    @student = create(:student, name: "Leandro")
    @course = create(:course, title: "Javascript 101")
    @enrollment = create(:enrollment, student: @student, course: @course)
  end

  it "creates a new attendance" do
    visit new_attendance_path

    select @enrollment, from: "Enrollment"
    select "2024", from: "attendance_date_1i"
    select "July", from: "attendance_date_2i"
    select "11", from: "attendance_date_3i"
    select "Absent", from: "Status"

    click_on "Create Attendance"

    expect(page).to have_text("Attendance was successfully created.")
    expect(page).to have_text("Leandro")
    expect(page).to have_text("Javascript 101")
    expect(page).to have_text("11/07/24")
    expect(page).to have_text("Absent")
  end
end