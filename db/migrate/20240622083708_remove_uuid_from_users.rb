class RemoveUuidFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :uuid, :string
  end
end
