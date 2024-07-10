class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  has_many :grades, :dependent => :destroy
  has_many :attendances, :dependent => :destroy

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :student_id, uniqueness: { scope: :course_id, message: "is already enrolled in this course" }

  def to_s
    "#{student.name} - #{course.title}"
  end
end
