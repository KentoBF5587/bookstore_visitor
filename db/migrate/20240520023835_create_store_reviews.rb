class CreateStoreReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :store_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bookstore, null: false, foreign_key: true
      
      t.date :date_entered, null: false
      t.string :opportunity, null: false
      t.string :first_visit, null: false
      t.string :favorite_reason, null: false
      t.string :free_description

      t.timestamps
    end
  end
end
