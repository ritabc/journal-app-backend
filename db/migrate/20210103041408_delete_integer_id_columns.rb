class DeleteIntegerIdColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :integer_id
    remove_column :journals, :integer_id
    remove_column :notes, :integer_id
  end
end
