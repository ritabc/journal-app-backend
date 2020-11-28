class AddUserDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :google_id, :google_account_id
    add_column :users, :email, :string
    add_column :users, :given_name, :string
    add_column :users, :family_name, :string
  end
end
