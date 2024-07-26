class AddBookmarkableToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :bookmarkable, polymorphic: true, index: true
  end
end
