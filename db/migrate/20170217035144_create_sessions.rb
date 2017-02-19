class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :guid
      t.references :account
      t.datetime :expires_at

      t.index :guid, unique: true
      t.timestamps
    end
  end
end
