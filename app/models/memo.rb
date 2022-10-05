class Memo < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
end
