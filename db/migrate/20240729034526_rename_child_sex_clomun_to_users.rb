class RenameChildSexClomunToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :child_sexgit, :child_sex
  end
end
