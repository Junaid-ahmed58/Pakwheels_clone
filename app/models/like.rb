class Like < ApplicationRecord
  belongs_to :user
  belongs_to :car

  def self.already_liked
    where(user_id: current_scope, car_id:[:car_id]).exists?
  end
end
