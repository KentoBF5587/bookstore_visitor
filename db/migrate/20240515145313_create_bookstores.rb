class CreateBookstores < ActiveRecord::Migration[7.1]
  def change
    create_table :bookstores do |t|
      t.string :name,              null: false
      t.string :address,           null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
