class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :car_id }
  belongs_to :user
  belongs_to :car
end
