class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  validates :content, presence: true
  def self.NumberOfLikes secret_id
  	Like.where(secret_id: secret_id).count
  end
end
