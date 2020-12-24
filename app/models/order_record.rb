class OrderRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :house_number, :phone_number, :building_name, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } 
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality,
                   house_number: house_number, phone_number: phone_number, building_name: building_name, record_id: record.id)
  end
end