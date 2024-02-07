class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :post
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :active_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower
  has_many :followings, through: :active_follows, source: :followee
  
  
  
  has_one_attached :icon_image
  
  def active?
    is_active
  end
  
  def get_icon_image(width, height)
    unless icon_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      icon_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    icon_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # フォロー機能
  def follow(user)
    active_follows.create(followee_id: user.id)
  end
  
  def unfollow(user)
    active_follows.find_by(followee_id: user.id).destroy
  end
  
  def following?(user)
    followings.include?(user)
  end
  
  
  # 検索機能
  def self.search_for(content, method)
    if method == "perfect"
      User.where(user_name: content)
    elsif method == "forward"
      User.where("user_name LIKE ?", content + "%")
    elsif method == "backward"
      User.where("user_name LIKE ?", "%" + content)
    elsif search == "partial_match"
      User.where("user_name LIKE ?", "%" + content + "%")
    else
      User.all
    end
  end

 

end
