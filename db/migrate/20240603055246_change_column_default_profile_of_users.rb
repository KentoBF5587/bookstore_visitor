class ChangeColumnDefaultProfileOfUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :profile, from: nil, to: "こんにちは"
  end
end
