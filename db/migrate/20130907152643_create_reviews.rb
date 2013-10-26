class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :user_id
      t.integer :days
      t.integer :budget
      t.string :category
      t.string :city
      t.string :state
      t.string :country
      t.string :season
      t.float  :latitude
      t.float  :longitude
      t.timestamps
    end
      add_index :reviews, [:user_id, :created_at]
  end
end
