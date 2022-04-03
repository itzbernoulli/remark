namespace :movie do
  require 'csv'
  desc 'This Task will setup the db using movies.csv and reviews.csv'
  task upload: :environment do
    puts 'Populating the database with movies from movies.csv'
    CSV.foreach(Rails.root.join('movies.csv'), headers: true) do |row|
      director = Director.where(name: row['Director']).first_or_create
      movie = Movie.where(name: row['Movie']).first_or_create do |movie|
        movie.description = row['Description']
        movie.year = row['Year']
      end
      MovieDirector.where(director: director, movie: movie).first_or_create
      actor = Actor.where(name: row['Actor']).first_or_create
      country = Country.where(name: row['Country']).first_or_create
      filming_location = FilmingLocation.where(name: row['Filming location'], country_id: country.id).first_or_create

      ActorFilmingLocation.where(movie: movie, actor: actor, filming_location: filming_location).first_or_create
      puts 'Done! Sample data added.'
    end
  end

  desc 'This task will attach all reviews to movies'
  task review: :environment do
    puts 'Populating the database with reviews from reviews.csv'
    CSV.foreach(Rails.root.join('reviews.csv'), headers: true) do |row|
      user = User.where(name: row['User']).first_or_create
      movie = Movie.find_by_name(row['Movie'])
      Review.create(movie: movie, user: user, stars: row['Stars'], comment:row['Review'])
      puts 'Done! Sample data added.'
    end
  end
end
