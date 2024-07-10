class Student < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    has_many :enrollments, :dependent => :destroy
    has_many :courses, through: :enrollments
    has_many :grades, through: :enrollments
    has_many :attendances, through: :enrollments
end
