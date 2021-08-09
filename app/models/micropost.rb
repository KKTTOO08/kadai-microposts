class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 255 }
  
  has_many :favorites
  has_many :okiniirisaretar, through: :favorites, source: :user
  
def beokiniiri(user)
  favorites.find_or_create_by(user_id: user.id)
end

def okiniirisareta?(user)
  okiniirisaretar.include?(user)
end

def benotokiniiri(user)
  favorite = favorites.find_by(user_id: user.id)
  favorite.destroy if favorite
end
  
end
