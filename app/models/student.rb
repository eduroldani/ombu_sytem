class Student < ApplicationRecord

    include PgSearch::Model
  pg_search_scope :search_student,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


  has_many :rooms, dependent: :destroy
  has_many :courses
  has_one_attached :photo
end
