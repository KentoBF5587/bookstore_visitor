class AddUserToBookstore < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookstores, :user, null: false, foreign_key: true
  end
end
