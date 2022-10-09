class Memo < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy

  validates :body, :createdAt, :updatedAt, :completedAt, :deletedAt,  presence: true
end
