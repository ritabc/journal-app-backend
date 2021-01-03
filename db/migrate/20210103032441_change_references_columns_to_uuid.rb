class ChangeReferencesColumnsToUuid < ActiveRecord::Migration[6.0]
  def change
    # change_column :journals, :user_id, null: false

    execute "ALTER TABLE journals ALTER COLUMN user_id SET DATA TYPE UUID USING (gen_random_uuid());"
    execute "ALTER TABLE notes ALTER COLUMN journal_id SET DATA TYPE UUID USING (gen_random_uuid());"
  end
end
