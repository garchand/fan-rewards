class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :campaigns, dependent: :destroy
  has_many :restaurants_ambassadors, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
