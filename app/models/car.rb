class Car < ApplicationRecord
  searchkick
  VENDOR_NAMES = ['Toyota', 'Honda', 'Suzuki', 'Tesla', 'Mercedes', 'BMW', 'Hyundai', 'Kia'].freeze
  has_many_attached :images
  validates :vendor, :car_name, :model, :engine_capacity, :millage, :color, :price, presence: true
end
