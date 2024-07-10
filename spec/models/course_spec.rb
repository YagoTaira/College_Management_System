require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    course = build(:course)
    expect(course).to be_valid
  end

  it "is not valid without a title" do
    course = build(:course, title: nil)
    expect(course).not_to be_valid
  end

  it "is not valid without a description" do
    course = build(:course, description: nil)
    expect(course).not_to be_valid
  end
end