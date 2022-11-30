class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :campaigns

  validates :name, presence: true, length: { minimum: 4 }
  validates :address, presence: true, length: { minimum: 8 }
  validates :description, presence: true
end
