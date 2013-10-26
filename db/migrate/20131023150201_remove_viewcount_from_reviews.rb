class RemoveViewcountFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :viewcount, :integer
  end
end
