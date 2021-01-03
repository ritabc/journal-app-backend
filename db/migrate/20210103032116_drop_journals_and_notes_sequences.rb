class DropJournalsAndNotesSequences < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE ONLY journals ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :journals, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS journals_id_seq"

    execute "ALTER TABLE ONLY notes ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :notes, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS notes_id_seq"
  end
end
