class Like < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  
  validates :user_id, uniqunness: {scope: :post_id}
  
end
