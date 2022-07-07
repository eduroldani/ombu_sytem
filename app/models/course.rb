class Course < ApplicationRecord
  has_one_attached :photo
  validates :name, length: { minimum: 3 }, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: false
  validates :date, presence: false
  validates :capacity, presence: false
  validates :price, presence: false
  validates :minimun_age, presence: false
  validates :max_age, presence: false
  validates :photo, presence: true

end
