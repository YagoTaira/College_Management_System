require 'rails_helper'

RSpec.describe "Grades", type: :system do
  before do
    @student = create(:student, name: "Matthew")
    @course = create(:course, title: "Ruby on Rails")
    @enrollment = create(:enrollment, student: @student, course: @course)
  end

  it "creates a new grade" do
    visit new_grade_path

    select @enrollment, from: "Enrollment"
    fill_in "Grade Score", with: "85"

    click_on "Create Grade"

    expect(page).to have_text("Grade was successfully created.")
    expect(page).to have_text("Matthew")
    expect(page).to have_text("Ruby on Rails")
    expect(page).to have_text("85")
  end
end