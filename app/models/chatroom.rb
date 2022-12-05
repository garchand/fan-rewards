class Chatroom < ApplicationRecord
  belongs_to :restaurant
  has_many :messages
end
