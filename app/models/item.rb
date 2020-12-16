class Item < ApplicationRecord

  belongs_to       :user
  has_one_attached :image

  # 都道府県
  belongs_to :prefecture
  validates :prefecture, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

end
