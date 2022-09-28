class User < ApplicationRecord
  has_many :memo
  has_one :setting

  validates :uid, presence: true
end
