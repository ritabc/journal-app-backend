class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # The Google Account ID or 'sub' ID (different from Google ID Token)
      t.string :google_id
      
      t.timestamps
    end
  end
end
