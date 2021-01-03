class UseUuidsForJournalsAndNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :journals, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :journals, :id, :integer_id
    rename_column :journals, :uuid, :id
    execute "ALTER TABLE journals DROP CONSTRAINT journals_pkey CASCADE;"
    execute "ALTER TABLE journals ADD PRIMARY KEY(id);"
    
    add_column :notes, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :notes, :id, :integer_id
    rename_column :notes, :uuid, :id
    execute "ALTER TABLE notes DROP CONSTRAINT notes_pkey CASCADE;"
    execute "ALTER TABLE notes ADD PRIMARY KEY(id);"
  end
end
