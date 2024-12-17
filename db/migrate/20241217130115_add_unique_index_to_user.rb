class AddUniqueIndexToUser < ActiveRecord::Migration[7.1]
  def change
    add_index :users, [:email, :deleted_at], unique: true
  end
end
