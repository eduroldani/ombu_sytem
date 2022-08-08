class Room < ApplicationRecord
  belongs_to :student
  belongs_to :course
  validates :course_id, presence: true

end
