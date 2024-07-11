class Attendance < ApplicationRecord
  belongs_to :enrollment

  validates :enrollment_id, presence: true
  validates :status, presence: true
  validates :date, presence: true, uniqueness: { message: "is already registered" }
  validate :date_cannot_be_in_the_future

  private

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "cannot be in the future")
    end
  end
end
