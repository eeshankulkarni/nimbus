class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :review_id

      t.timestamps
    end
      add_index :comments, [:review_id, :created_at]
  end
end
