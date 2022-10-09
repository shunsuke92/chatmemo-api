class Comment < ApplicationRecord
  belongs_to :memo

  validates :body, :createdAt, :updatedAt, :deletedAt,  presence: true
end
