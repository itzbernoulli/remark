namespace :setup do
  require 'csv'
  desc 'This Task will setup the db using movies.csv and reviews.csv'
  task movies: :environment do
    CSV.foreach(Rails.root.join('movies.csv'), headers: true) do |row|
      director = Director.where(name: row['Director']).first_or_create
      movie = Movie.where(name: row['Movie']).first_or_create do |m|
        m.description = row['Description']
        m.year = row['Year']
      end
      MovieDirector.where(director:, movie:).first_or_create
      actor = Actor.where(name: row['Actor']).first_or_create
      country = Country.where(name: row['Country']).first_or_create
      filming_location = FilmingLocation.where(name: row['Filming location'], country_id: country.id).first_or_create

      ActorFilmingLocation.where(movie:, actor:, filming_location:).first_or_create
    end
  end

  desc 'This task will attach all reviews to movies'
  task reviews: :environment do
    CSV.foreach(Rails.root.join('reviews.csv'), headers: true) do |row|
      user = User.where(name: row['User']).first_or_create
      movie = Movie.find_by_name(row['Movie'])
      Review.create(movie:, user:, stars: row['Stars'], comment: row['Review'])
    end
  end
end
