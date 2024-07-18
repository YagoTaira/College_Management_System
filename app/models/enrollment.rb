class Enrollment < ApplicationRecord
  # Associations
  belongs_to :student
  belongs_to :course
  belongs_to :lecturer

  has_many :grades, :dependent => :destroy
  has_many :attendances, :dependent => :destroy

  # Validations
  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :lecturer_id, presence: true
  # Ensures a student can only enroll once in a specific course
  validates :student_id, uniqueness: { scope: :course_id, message: "is already enrolled in this course" }

  # String representation of the enrollment
  def to_s
    "#{student.name} - #{course.title}"
  end
end