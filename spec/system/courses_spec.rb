require 'rails_helper'

RSpec.describe "Courses", type: :system do
  it "creates a new course" do
    visit new_course_path

    fill_in "Title", with: "Cloud Application Development"
    fill_in "Description", with: "The main focus of this module is to teach students about creating and uploading application to the cloud using Ruby on Rails and AWS EC2"

    click_on "Create Course"

    expect(page).to have_text("Course was successfully created.")
    expect(page).to have_text("Cloud Application Development")
    expect(page).to have_text("The main focus of this module is to teach students about creating and uploading application to the cloud using Ruby on Rails and AWS EC2")
  end
end