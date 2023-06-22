class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
  validates :genre, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
  validates :year, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Date.today.year }
  validates :published_at, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true, length: { minimum: 10, maximum: 2000 }
end
