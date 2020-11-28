class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      # TODO: the following is for setup: do not actually store google id in DB!
      t.string :google_id
      
      t.timestamps
    end
  end
end
