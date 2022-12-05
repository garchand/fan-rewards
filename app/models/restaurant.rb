class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :campaigns, dependent: :destroy
  has_many :restaurants_ambassadors, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  validates :name, presence: true, length: { minimum: 4 }
  validates :address, presence: true, length: { minimum: 8 }
  validates :description, presence: true
end
