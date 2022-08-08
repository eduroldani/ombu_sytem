class Student < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :courses
  has_one_attached :photo
end
