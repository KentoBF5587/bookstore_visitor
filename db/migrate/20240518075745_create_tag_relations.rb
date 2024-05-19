class CreateTagRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_relations do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :bookstore, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tag_relations, [:tag_id, :bookstore_id], unique: true
  end
end
