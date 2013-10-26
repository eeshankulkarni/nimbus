class RemoveColumnsFromReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :state, :string
    remove_column :reviews, :country, :string
    remove_column :reviews, :latitude, :float
    remove_column :reviews, :longitude, :float
  end
end
