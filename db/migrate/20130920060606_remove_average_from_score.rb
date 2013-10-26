class RemoveAverageFromScore < ActiveRecord::Migration
  def change
    remove_column :scores, :average, :float
  end
end
