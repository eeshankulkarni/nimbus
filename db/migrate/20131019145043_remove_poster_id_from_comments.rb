class RemovePosterIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :poster_id, :integer
  end
end
