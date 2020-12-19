class Item < ApplicationRecord
  with_options presence: true do
    validates     :title
    validates     :produce_description
    validates     :category_id
    validates     :produce_condition_id
    validates     :shipping_charges_id
    validates     :prefecture_id
    validates     :days_to_delivery_id
    validates     :price
    validates     :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_delivery
  belongs_to_active_hash :produce_condition
  belongs_to_active_hash :shipping_charges
end
