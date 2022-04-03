class CreateActorFilmingLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :actor_filming_locations do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true
      t.references :filming_location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
