class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,                 null: false
      t.text        :produce_description,   null: false
      t.integer     :categories_id,         null: false
      t.integer     :produce_conditions_id, null: false
      t.integer     :shipping_charges_id,   null: false
      t.integer     :prefectures_id,        null: false
      t.integer     :days_to_deliveries_id, null: false
      t.integer     :price,                 null: false
      t.references  :user,                  foreign_key: true
      t.timestamps
    end
  end
end
