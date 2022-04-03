class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = params[:search] ? Movie.all_associations.actor_search(params[:search]) : Movie.all_associations
  end
end
