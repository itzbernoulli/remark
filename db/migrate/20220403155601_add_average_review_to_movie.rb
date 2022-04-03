class AddAverageReviewToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :average_review, :float, default: 0.0
  end
end
