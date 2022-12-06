class User < ApplicationRecord
  has_one :restaurant, dependent: :destroy
  has_many :restaurants_ambassadors, dependent: :destroy
  has_many :campaigns_ambassadors
  has_many :campaigns, through: :campaigns_ambassadors
  has_many :restaurants, through: :restaurants_ambassadors

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
