require 'rails_helper'

RSpec.describe Grade, type: :model do
  it "is valid with valid attributes" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: 85)
    expect(grade).to be_valid
  end

  it "is not valid without a score" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: nil)
    expect(grade).not_to be_valid
  end

  it "is not valid with a score less than 0" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: -1)
    expect(grade).not_to be_valid
  end

  it "is not valid with a score greater than 100" do
    enrollment = create(:enrollment)
    grade = Grade.new(enrollment: enrollment, score: 101)
    expect(grade).not_to be_valid
  end

  it "is not valid with a duplicate enrollment" do
    enrollment = create(:enrollment)
    Grade.create!(enrollment: enrollment, score: 90)
    duplicate_grade = Grade.new(enrollment: enrollment, score: 85)
    expect(duplicate_grade).not_to be_valid
  end
end