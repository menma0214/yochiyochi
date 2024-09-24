class AddEventUrlToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :event_url, :text
  end
end
