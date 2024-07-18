class Lecturer < ApplicationRecord
    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
    # Associations
    has_many :enrollments
end