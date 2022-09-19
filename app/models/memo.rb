class Memo < ApplicationRecord
  belongs_to :user
  has_many :reply
end
