class Room < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :course_id, presence: true
  validates :ammount, numericality: true
  validates :modified_price, numericality: true


end
