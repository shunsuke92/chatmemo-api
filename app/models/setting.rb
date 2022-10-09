class Setting < ApplicationRecord
  belongs_to :user

  validates :dark_mode ,inclusion: {in: %w(os dark light)}
end
