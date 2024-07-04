class Course < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    has_many :enrollments, :dependent => :destroy
    has_many :students, through: :enrollments
    has_many :grades, through: :enrollments
    has_many :attendances, through: :enrollments
end
