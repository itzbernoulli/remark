# Remark Group

This assignment is about writing a small Ruby On Rails application. Use a methodology that works for you or that you are used to.
- Create a new application with Ruby on Rails
- Study the content of movies.csv and reviews.csv (see attachment)
- Define a database schema and add it to your application
- Write an import task to import both CSV-files
- Show an overview of all movies in your application
- Make a search form to search for an actor
- Sort the overview by average stars (rating) in an efficient way


This project is written in Ruby 3.1.0 and Rails 7.0.2 and uses an sqlite database

## Setup Instructions

After pulling the project, 

```db:create db:migrate setup:movies setup:reviews```

This will setup the database to be ready for use.
Next run ```rails s``` to get the project started on the default port 3000 and visit ```localhost:3000``` to view the application.