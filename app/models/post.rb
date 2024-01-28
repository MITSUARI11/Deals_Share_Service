class Post < ApplicationRecord
  has_one_attached :post_image
  
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  
  validates :shop_genre, presence: true
  validates :shop_name, presence: true
  validates :address, presence: true
  validates :post_image, presence: true, allow_blank: true
  validates :posting_text, presence: true
  
  enum shop_genre: { food: 0, apparel: 1, beauty: 2, entertainment: 3, leisure: 4, hotel: 5, real_estate: 6, besides: 7 }
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  # 検索機能
  scope :search_by_column, ->(column, text) { where("#{column} LIKE ?", "%#{text}%") }
end
