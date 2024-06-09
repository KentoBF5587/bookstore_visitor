class CreateWannaGoBookstores < ActiveRecord::Migration[7.1]
  def change
    create_table :wanna_go_bookstores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookstore, null: false, foreign_key: true

      t.timestamps
    end
      add_index :wanna_go_bookstores, [:user_id, :bookstore_id], unique: true
  end
end
