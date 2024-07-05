require 'rails_helper'

RSpec.describe "Students", type: :system do
  it "creates a new student" do
    visit new_student_path

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john.doe@example.com"
    fill_in "Age", with: "25"

    click_on "Create Student"

    expect(page).to have_text("Student was successfully created.")
    expect(page).to have_text("John Doe")
    expect(page).to have_text("25")
  end
end