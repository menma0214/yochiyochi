class RemoveLikeToUser < ActiveRecord::Migration[7.1]
  def down
    remove_column :users, :like
  end
end
