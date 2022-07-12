# README

## usersテーブル

|Column               |Type   |Options                 |
|---------------------|-------|------------------------|
|nickname             |string |null: false             |
|email                |string |null: false,unique: true|
|encrypted_password   |string |null: false             |
|password_confirmation|string |null: false             |
|last_name            |string |null: false             |
|first_name           |string |null: false             |
|last_name_kana       |string |null: false             |
|first_name_lana      |string |null: false             |
|birthday             |date   |null: false             |

### Association
has_many :items
has_many :purchases

## itemsテーブル
|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|item_name    |string    |null: false                   |
|messages     |text      |null: false                   |
|category_id  |string    |null: false                   |
|situation_id |string    |null: false                   |
|price_bear_id|string    |null: false                   |
|area_id      |string    |null: false                   |
|days         |string    |null: false                   |
|price        |integer   |null: false                   |
|user         |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル
|Column        |Type   |Options                       |
|--------------|-------|------------------------------|
|user          |integer|null: false, foreign_key: true|
|item          |integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル
|Column        |Type      |Options                        |
|--------------|----------|------------------------------ |
|post_cord     |integer   |null: false                    |
|prefecture    |string    |null: false                    |
|city          |string    |null: false                    |
|block_number  |string    |null: false                    |
|building      |string    |                               |
|phone_number  |string    |null: false                    |
|purchases     |references|null: false, foreign_key: true |

### Association
belongs_to :purchase