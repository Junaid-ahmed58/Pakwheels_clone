class Car < ApplicationRecord
  searchkick
  VENDOR_NAMES = ['Toyota', 'Honda', 'Suzuki', 'Tesla', 'Mercedes', 'BMW', 'Hyundai', 'Kia'].freeze
  has_many_attached :images
  validates :vendor, :car_name, :model, :engine_capacity, :millage, :color, :price, presence: true

  def self.search(params)
    results = all
    results = results.where("vendor LIKE ?", "%#{params[:vendor]}%") if params[:vendor].present?
    results = results.where("car_name LIKE ?", "%#{params[:car_name]}%") if params[:car_name].present?
    results = results.where("model LIKE ?", "%#{params[:model]}%") if params[:model].present?
    results = results.where("category LIKE ?", "%#{params[:category]}%") if params[:category].present?
    results = results.where("engine_capacity LIKE ?", "%#{params[:engine_capacity]}%") if params[:engine_capacity].present?
    results
  end
end
