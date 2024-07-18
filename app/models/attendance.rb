class Attendance < ApplicationRecord
  # Associations
  belongs_to :enrollment

  # Validations
  validates :enrollment_id, presence: true
  validates :status, presence: true
  # Ensures unique attendance record per enrollment and date
  validates :date, presence: true, uniqueness: { scope: :enrollment_id, message: "has already been registered for this student" }
  # Custom validation to prevent future dates
  validate :date_cannot_be_in_the_future

  private

  # Custom validation method
  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "cannot be in the future")
    end
  end
end