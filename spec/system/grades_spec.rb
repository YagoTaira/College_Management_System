# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Grade system tests
RSpec.describe "Grades", type: :system do
  # Set up test data before each test
  before do
    # Create a student record with the name "Matthew"
    @student = create(:student, name: "Matthew")
    # Create a course record with the title "Ruby on Rails"
    @course = create(:course, title: "Ruby on Rails")
    # Create an enrollment record associating the student and the course
    @enrollment = create(:enrollment, student: @student, course: @course)
  end

  # Test case: Creating a new grade
  it "creates a new grade" do
    # Visit the new grade page
    visit new_grade_path

    # Fill in the form fields by selecting the enrollment and entering the grade score
    select @enrollment, from: "Enrollment"
    fill_in "Grade Score", with: "85"

    # Submit the form
    click_on "Create Grade"

    # Check for success message
    expect(page).to have_text("Grade was successfully created.")
    
    # Verify the displayed information
    expect(page).to have_text("Matthew")
    expect(page).to have_text("Ruby on Rails")
    expect(page).to have_text("85")
  end
end