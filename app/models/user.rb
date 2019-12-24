class User < ApplicationRecord

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :name, length: { maximum: 30}

  validates :introduction, length: { maximum: 100}

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

end
