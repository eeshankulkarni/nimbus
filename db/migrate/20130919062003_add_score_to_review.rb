class AddScoreToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :score, :integer
  end
end
