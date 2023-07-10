class Car < ApplicationRecord
  VENDOR_NAMES = ['Toyota', 'Honda', 'Suzuki', 'Tesla', 'Mercedes', 'BMW', 'Hyundai', 'Kia'].freeze
  has_many_attached :images
  validates :vendor, :car_name, :model, :engine_capacity, :millage, :color, :price, presence: true
  validates :car_name, :model, :engine_capacity, :price, uniqueness: true
end
