class Car < ApplicationRecord
  VENDOR_NAMES = ['Toyoya', 'Honda', 'Suzuki', 'Tesla', 'Mercedes', 'BMW']
  has_many_attached :images
end
