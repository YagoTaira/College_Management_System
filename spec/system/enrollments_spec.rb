# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Enrollment system tests
RSpec.describe "Enrollments", type: :system do
  # Set up test data before each test
  before do
    # Create a student record with the name "Matthew"
    @student = create(:student, name: "Matthew")
    # Create a course record with the title "Ruby on Rails"
    @course = create(:course, title: "Ruby on Rails")
    # Create a lecturer record with the name "Giovani"
    @lecturer = create(:lecturer, name: "Giovani")
  end

  # Test case: Creating a new enrollment
  it "creates a new enrollment" do
    # Visit the new enrollment page
    visit new_enrollment_path

    # Fill in the form fields by selecting the student, course, and lecturer
    select @student.name, from: "Student"
    select @course.title, from: "Course"
    select @lecturer.name, from: "Lecturer"

    # Submit the form
    click_on "Create Enrollment"

    # Check for success message
    expect(page).to have_text("Enrollment was successfully created.")
    
    # Verify the displayed information
    expect(page).to have_text("Matthew")
    expect(page).to have_text("Ruby on Rails")
    expect(page).to have_text("Giovani")
  end
end