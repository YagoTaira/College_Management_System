require 'rails_helper'

RSpec.describe Lecturer, type: :model do
  it "is valid with valid attributes" do
    lecturer = build(:lecturer)
    expect(lecturer).to be_valid
  end

  it "is not valid without a name" do
    lecturer = build(:lecturer, name: nil)
    expect(lecturer).to_not be_valid
  end

  it "is not valid without an email" do
    lecturer = build(:lecturer, email: nil)
    expect(lecturer).to_not be_valid
  end

  it "is not valid with a duplicate email" do
    create(:lecturer, email: "test@example.com")
    lecturer = build(:lecturer, email: "test@example.com")
    expect(lecturer).to_not be_valid
  end
end