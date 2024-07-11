class Lecturer < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :enrollments
end
