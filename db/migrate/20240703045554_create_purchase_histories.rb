class CreatePurchaseHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_histories do |t|
      t.date :purchase_date
      t.string :title, null: false
      t.string :author_name
      t.string :note

      t.references :user, null: false, foreign_key: true
      t.references :store_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
