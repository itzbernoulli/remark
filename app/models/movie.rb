class Movie < ApplicationRecord
  has_many :movie_directors
  has_many :reviews, -> { order(stars: :desc) }
  has_many :actor_filming_locations
  has_many :filming_locations, through: :actor_filming_locations
  has_many :actors, through: :actor_filming_locations
  has_many :directors, through: :movie_directors

  scope :all_accociations, -> { includes(reviews: [:user], actor_filming_locations: [:actor,filming_location: [:country]])}
  scope :actor_search, ->(name) { where("actors.name LIKE ?", "%#{name}%").references(:actors)}
end
