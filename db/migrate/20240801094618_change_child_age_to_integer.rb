class ChangeChildAgeToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :child_age, 'integer USING CAST(child_age AS integer)'
  end
end
