class Student < ActiveRecord::Base
  has_many :grades
  has_many :parents
  belongs_to :teacher
  has_secure_password
end
