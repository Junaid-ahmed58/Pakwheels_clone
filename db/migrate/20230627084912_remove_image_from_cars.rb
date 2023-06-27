class RemoveImageFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :image, :text
    remove_column :cars, :make, :string
    remove_column :cars, :year, :integer
  end
end
