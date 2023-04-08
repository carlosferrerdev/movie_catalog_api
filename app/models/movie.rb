class Movie < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :year, presence: true
  validates :published_at, presence: true
  validates :description, presence: true
end
