class AddColumnsToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :district, :string
    add_column :reviews, :address, :string
    add_column :reviews, :location_name, :string
    add_column :reviews, :phone_number, :string
    add_column :reviews, :postcode, :string
    add_column :reviews, :country, :string
    add_column :reviews, :lat, :decimal
    add_column :reviews, :lng, :decimal
  end
end
