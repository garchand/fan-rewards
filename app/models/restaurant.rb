class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :campaigns

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
