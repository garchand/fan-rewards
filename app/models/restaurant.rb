class Restaurant < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :adress, presence: true
  validates :descriotion, presence: true
end
