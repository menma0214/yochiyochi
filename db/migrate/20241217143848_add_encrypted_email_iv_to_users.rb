class AddEncryptedEmailIvToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :encrypted_email_iv, :string
  end
end
