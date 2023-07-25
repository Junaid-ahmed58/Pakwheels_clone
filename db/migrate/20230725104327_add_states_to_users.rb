class AddStatesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :states, :string
    add_column :users, :cities, :string
  end
end
