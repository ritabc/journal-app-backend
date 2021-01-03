class UseUuids < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'
    add_column :users, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :users, :id, :integer_id
    rename_column :users, :uuid, :id
    execute "ALTER TABLE users DROP CONSTRAINT users_pkey CASCADE;"
    execute "ALTER TABLE users ADD PRIMARY KEY(id);"

    # Optinally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY users ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :users, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS users_id_seq"
  end
end
