class ActorFilmingLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
  belongs_to :filming_location
end
