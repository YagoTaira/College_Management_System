class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :grades, :dependent => :destroy
  has_many :attendances, :dependent => :destroy
end
