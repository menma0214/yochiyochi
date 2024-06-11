class RemoveMovieToFacilities < ActiveRecord::Migration[7.1]
  def up
    remove_column :facilities, :movie
  end

  def down
    add_column :facilities, :movie, :string
  end
end
