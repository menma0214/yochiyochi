class AddEventIdToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :event, foreign_key: true
  end
end
