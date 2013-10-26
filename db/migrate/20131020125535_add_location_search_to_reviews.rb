class AddLocationSearchToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :location_search, :string
  end
end
