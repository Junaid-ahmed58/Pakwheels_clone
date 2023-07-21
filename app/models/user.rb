class User < ApplicationRecord
  enum role: { user: 'user', admin: 'admin' }
  enum status: { active: 'active', deactive: 'deactive' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cars, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
