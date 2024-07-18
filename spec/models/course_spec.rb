# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Course model
RSpec.describe Course, type: :model do
  # Test for valid attributes
  it "is valid with valid attributes" do
    course = build(:course)
    expect(course).to be_valid
  end

  # Test for presence of title
  it "is not valid without a title" do
    course = build(:course, title: nil)
    expect(course).not_to be_valid
  end

  # Test for presence of description
  it "is not valid without a description" do
    course = build(:course, description: nil)
    expect(course).not_to be_valid
  end
end