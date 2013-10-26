class AddAverageScoreToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :average_score, :float
  end
end
