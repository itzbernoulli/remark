class Director < ApplicationRecord
  has_many :movies, through: :movie_directors
end
