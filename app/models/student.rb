class Student < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :courses, through: :rooms3
  has_one_attached :photo
end
