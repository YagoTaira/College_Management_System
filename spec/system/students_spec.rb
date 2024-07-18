# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Student system tests
RSpec.describe "Students", type: :system do
  # Test case: Creating a new student
  it "creates a new student" do
    # Visit the new student page
    visit new_student_path

    # Fill in the form fields
    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john.doe@example.com"
    fill_in "Age", with: "25"

    # Submit the form
    click_on "Create Student"

    # Check for success message
    expect(page).to have_text("Student was successfully created.")
    
    # Verify the displayed information
    expect(page).to have_text("John Doe")
    expect(page).to have_text("25")
  end
end