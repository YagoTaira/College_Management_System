require 'rails_helper'

RSpec.describe "Enrollments", type: :system do
  before do
    @student = create(:student, name: "Matthew")
    @course = create(:course, title: "Ruby on Rails")
  end

  it "creates a new enrollment" do
    visit new_enrollment_path

    select @student.name, from: "Student"
    select @course.title, from: "Course"

    click_on "Create Enrollment"

    expect(page).to have_text("Enrollment was successfully created.")
    expect(page).to have_text("Matthew")
    expect(page).to have_text("Ruby on Rails")
  end
end