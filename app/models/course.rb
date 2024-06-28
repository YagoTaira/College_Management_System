class Course < ApplicationRecord
    has_many :enrollments
    has_many :students, through: enrollments
    has_many :grades, through: enrollments
    has_many :attendances, through: enrollments
end
