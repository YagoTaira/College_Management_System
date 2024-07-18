# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Lecturer system tests
RSpec.describe "Lecturers", type: :system do
  # Test case: Creating a new lecturer
  it "creates a new lecturer" do
    # Visit the new lecturer page
    visit new_lecturer_path

    # Fill in the form fields
    fill_in "Name", with: "Lilly Ann"
    fill_in "Email", with: "lilly.ann@example.com"

    # Submit the form
    click_on "Create Lecturer"

    # Check for success message
    expect(page).to have_text("Lecturer was successfully created.")
    
    # Verify the displayed information
    expect(page).to have_text("Lilly Ann")
    expect(page).to have_text("lilly.ann@example.com")
  end
end