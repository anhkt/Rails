class Micropost < ActiveRecord::Base
  belongs_to :user
  scope :order_by_created_at, -> {order created_at: :desc}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}

  scope :feeds, ->(following_ids, user_id){
    where("user_id IN (?) OR user_id = ?", following_ids, user_id)}
end
