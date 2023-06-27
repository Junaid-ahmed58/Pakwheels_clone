class AddVendorToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :vendor, :string
    add_column :cars, :car_name, :string
    add_column :cars, :millage, :string
    add_column :cars, :category, :string
    add_column :cars, :description, :string
    add_column :cars, :engine_capacity, :string
  end
end
