class Item < ApplicationRecord
  with_options presence: true do
    validates     :title
    validates     :produce_description
    validates     :categories_id
    validates     :produce_conditions_id
    validates     :shipping_charges_id
    validates     :prefectures_id
    validates     :days_to_deliveries_id
    validates     :price
    validates     :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to       :user
  has_one_attached :image
  has_one          :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categories
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :days_to_deliveries
  belongs_to_active_hash :produce_conditions
  belongs_to_active_hash :shipping_charges
end
