class AddAverageToScore < ActiveRecord::Migration
  def change
    add_column :scores, :average, :float
  end
end
