# Require the Rails test helper
require 'rails_helper'

# Begin RSpec test suite for the Lecturer model
RSpec.describe Lecturer, type: :model do
  # Test case: Lecturer is valid with all required attributes
  it "is valid with valid attributes" do
    lecturer = build(:lecturer)
    expect(lecturer).to be_valid
  end

  # Test case: Lecturer is invalid without a name
  it "is not valid without a name" do
    lecturer = build(:lecturer, name: nil)
    expect(lecturer).to_not be_valid
  end

  # Test case: Lecturer is invalid without an email
  it "is not valid without an email" do
    lecturer = build(:lecturer, email: nil)
    expect(lecturer).to_not be_valid
  end

  # Test case: Lecturer is invalid with a duplicate email
  it "is not valid with a duplicate email" do
    create(:lecturer, email: "test@example.com")
    lecturer = build(:lecturer, email: "test@example.com")
    expect(lecturer).to_not be_valid
  end
end