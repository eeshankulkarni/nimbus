class AddDpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dp, :string
  end
end
