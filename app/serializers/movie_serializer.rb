class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :year, :country, :published_at, :description
end
