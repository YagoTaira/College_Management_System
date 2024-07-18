# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Course system tests
RSpec.describe "Courses", type: :system do
  # Test case: Creating a new course
  it "creates a new course" do
    # Visit the new course page
    visit new_course_path

    # Fill in the form fields
    fill_in "Title", with: "Cloud Application Development"
    fill_in "Description", with: "The main focus of this module is to teach students about creating and uploading application to the cloud using Ruby on Rails and AWS EC2"

    # Submit the form
    click_on "Create Course"

    # Check for success message
    expect(page).to have_text("Course was successfully created.")
    
    # Verify the displayed information
    expect(page).to have_text("Cloud Application Development")
    expect(page).to have_text("The main focus of this module is to teach students about creating and uploading application to the cloud using Ruby on Rails and AWS EC2")
  end
end