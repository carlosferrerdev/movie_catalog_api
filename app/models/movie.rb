class Movie < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :genre, precense: true
  validates :year, presence: true
  validates :country, presence: true
  validates :published_at, presence: true
  validates :description, presence: true
end
