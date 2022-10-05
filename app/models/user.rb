class User < ApplicationRecord
  has_many :memo, dependent: :destroy
  has_one :setting, dependent: :destroy

  validates :uid, presence: true
end
