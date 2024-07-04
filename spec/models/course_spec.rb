require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    course = build(:course)
    expect(course).to be_valid
  end
end