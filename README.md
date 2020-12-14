#　テーブル設計

## users 

|Column          |Type    |Options       |
|----------------|--------|--------------|
| email          | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname       | string | null: false |
| lastname       | string | null: false |
| firstname      | string | null: false |
| lastnamehuri   | string | null: false |
| firastnamehuri | string | null: false |
| birthday       | date   | null: false |

### Association
has_many : items
has_many : records

## items 

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| title               | string     | null: false                    |
| produce_description | text       | null: false                    |
| category_id         | integer    | null: false                    |
| produce_condition_id| integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_to_delivery_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to : user
has_one    : record

## records

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
belongs_to : user
belongs_to : item
has_one    : address

## addresses

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| phone_number        | string     | null: false                    |
| building_name       | string     |                                |
| record              | references | null: false, foreign_key: true |

### Association
belongs_to : record