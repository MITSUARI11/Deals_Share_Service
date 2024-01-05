class Post < ApplicationRecord
  has_one_attached :post_image
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :shop_genre, presence: true
  validates :shop_name, presence: true
  validates :address, presence: true
  validates :post_image, presence: true, allow_blank: true
  validates :posting_text, presence: true
  
  enum shop_genre: { food: 0, apparel: 1, beauty: 2, entertainment: 3, leisure: 4, hotel: 5, real_estate: 6, besides: 7 }
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  
end
