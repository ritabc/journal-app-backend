class AddCascadeToForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :journals, :users
    remove_foreign_key :notes, :journals
    
    add_foreign_key :journals, :users, on_delete: :cascade
    add_foreign_key :notes, :journals, on_delete: :cascade
  end
end
