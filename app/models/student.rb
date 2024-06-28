class Student < ApplicationRecord
    has_many :enrollments
    has_many :courses, through: :enrollments
    has_many :grades, through: :enrollments
    has_many :attendances, through: :enrollments
end
