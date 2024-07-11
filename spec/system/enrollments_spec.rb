require 'rails_helper'

RSpec.describe "Enrollments", type: :system do
  before do
    @student = create(:student, name: "Matthew")
    @course = create(:course, title: "Ruby on Rails")
    @lecturer = create(:lecturer, name: "Giovani")
  end

  it "creates a new enrollment" do
    visit new_enrollment_path

    select @student.name, from: "Student"
    select @course.title, from: "Course"
    select @lecturer.name, from: "Lecturer"

    click_on "Create Enrollment"

    expect(page).to have_text("Enrollment was successfully created.")
    expect(page).to have_text("Matthew")
    expect(page).to have_text("Ruby on Rails")
    expect(page).to have_text("Giovani")
  end
end