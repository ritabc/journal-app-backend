class AddTokensToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :token, :string
    add_column :users, :token_expires_at, :integer
    add_column :users, :refresh_token, :string
  end
end
