class FilmingLocation < ApplicationRecord
  belongs_to :country
  has_many :movies, through: :actor_filming_locations
  has_many :actors, through: :actor_filming_locations
end
