#　テーブル設計

## users 

|Column          |Type    |Options      |
|----------------|--------|-------------|
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| lastname       | string | null: false |
| firstname      | string | null: false |
| lastnamehuri   | string | null: false |
| firastnamehuri | string | null: false |
| birthday       | string | null: false |

### Association
has_many : item
has_many : record

## items 

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| image               |            |                                |
| title               | string     | null: false                    |
| produce_description | text       | null: false                    |
| category            | string     | null: false                    |
| produce_condition   | text       | null: false                    |
| shipping_charges    | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| days_to_delivery    | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to : user
has_one    : record

## records

|Column               |Type    |Options      |
|---------------------|--------|-------------|
| purchaes_history    | string | null: false |
| seller              | string | null: false |
| buyer               | string | null: false |

### Association
belongs_to : user
has_one    : item
has_many   : address

## addresses

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| postal_code         | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipality        | string     | null: false                    |
| address             | integer    | null: false                    |
| phone_number        | integer    | null: false                    |
| record              | references | null: false, foreign_key: true |

### Association
belongs_to : record