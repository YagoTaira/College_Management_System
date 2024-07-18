class Course < ApplicationRecord
    # Validations
    validates :title, presence: true
    validates :description, presence: true
    
    # Associations
    has_many :enrollments, :dependent => :destroy
    has_many :students, through: :enrollments
    has_many :grades, through: :enrollments
    has_many :attendances, through: :enrollments
end