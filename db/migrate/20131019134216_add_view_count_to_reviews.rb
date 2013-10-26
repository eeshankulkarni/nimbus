class AddViewCountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :viewcount, :integer
  end
end
