class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password_digest
      t.string :guid

      t.index :username, unique: true
      t.index :guid, unique: true
      t.timestamps
    end
  end
end