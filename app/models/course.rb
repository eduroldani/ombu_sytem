class Course < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :students

  has_one_attached :photo
  validates :name, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: false
  validates :date, presence: false
  validates :capacity, presence: false, numericality: true
  validates :price, presence: false, numericality: true
  validates :minimun_age, presence: false,numericality: true
  validates :max_age, presence: false,numericality: true
  validates :photo, presence: true
  validates :what, presence: true
  validates :how, presence: true
  validates :project, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_name_short_description,
  against: [ :name, :short_description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

#commet

end
