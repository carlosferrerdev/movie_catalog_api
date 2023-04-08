class Movie < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :genre, presence: true
  validates :year, presence: true
  validates :published_at, presence: true
  validates :description, presence: true

  self.primary_key = 'show_id'
end
