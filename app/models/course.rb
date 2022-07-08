class Course < ApplicationRecord


  has_one_attached :photo
  validates :name, length: { minimum: 3 }, presence: true , length: { maximum: 50 }
  validates :short_description, presence: true, length: { maximum: 100 }
  validates :long_description, presence: false, length: { maximum: 280 },length: { minimum: 50 }
  validates :date, presence: false
  validates :capacity, presence: false, numericality: true
  validates :price, presence: false, numericality: true
  validates :minimun_age, presence: false,numericality: true
  validates :max_age, presence: false,numericality: true
  validates :photo, presence: true
  validates :what, presence: true,length: { maximum: 280 },length: { minimum: 50 }
  validates :how, presence: true,length: { maximum: 280 },length: { minimum: 50 }
  validates :project, presence: true,length: { maximum: 280 },length: { minimum: 50 }

  include PgSearch::Model
  pg_search_scope :search_by_name_short_description,
  against: [ :name, :short_description ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }





end
