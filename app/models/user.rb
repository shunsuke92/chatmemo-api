class User < ApplicationRecord
  has_many :memo

  validates :uid, presence: true
end
