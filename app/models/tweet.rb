class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :replies

  validates :sentence, presence: true
  validates :sentence, length: { maximum: 140}
end
