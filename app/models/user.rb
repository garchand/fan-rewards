class User < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  has_many :restaurants_ambassadors, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
