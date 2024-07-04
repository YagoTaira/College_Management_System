require 'rails_helper'

RSpec.describe Student, type: :model do
  it "is valid with valid attributes" do
    student = build(:student)
    expect(student).to be_valid
  end

  it "is not valid without a name" do
    student = build(:student, name: nil)
    expect(student).to_not be_valid
  end

  it "is not valid without an email" do
    student = build(:student, email: nil)
    expect(student).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    create(:student, email: "test@example.com")
    student = build(:student, email: "test@example.com")
    expect(student).to_not be_valid
  end

  it "is not valid without an age" do
    student = build(:student, age: nil)
    expect(student).to_not be_valid
  end

  it "is not valid with a negative age" do
    student = build(:student, age: -1)
    expect(student).to_not be_valid
  end
end