class AddGMapsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :gmaps, :boolean
  end
end
