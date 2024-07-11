require 'rails_helper'

RSpec.describe "Lecturers", type: :system do
  it "creates a new lecturer" do
    visit new_lecturer_path

    fill_in "Name", with: "Lilly Ann"
    fill_in "Email", with: "lilly.ann@example.com"

    click_on "Create Lecturer"

    expect(page).to have_text("Lecturer was successfully created.")
    expect(page).to have_text("Lilly Ann")
    expect(page).to have_text("lilly.ann@example.com")
  end
end