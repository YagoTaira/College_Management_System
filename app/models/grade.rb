class Grade < ApplicationRecord
  # Associations
  belongs_to :enrollment

  # Validations
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # Ensures only one grade per enrollment
  validates :enrollment_id, uniqueness: { scope: :enrollment_id, message: "already has a grade" }
end