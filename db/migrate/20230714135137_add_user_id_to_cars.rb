class AddUserIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :user_id, :integer
    add_foreign_key :cars, :users
  end
end
