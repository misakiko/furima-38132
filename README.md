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
|birthday_year        |integer|null: false             |
|birthday_month       |integer|null: false             |
|birthday_day         |integer|null: false             |


### Association
has_many :items
has_many :purchases


## itemsテーブル
|Column    |Type      |Options                       |
|----------|----------|------------------------------|
|item_name |string    |null: false                   |
|messages  |text      |null: false                   |
|category  |string    |null: false                   |
|situation |string    |null: false                   |
|price_bear|string    |null: false                   |
|area      |string    |null: false                   |
|days      |string    |null: false                   |
|price     |integer   |null: false                   |
|user_id   |references|null: false, foreign_key: true|

### Association
belongs_to :user
has_one :purchase

## purchasesテーブル
|Column        |Type   |Options                       |
|--------------|-------|------------------------------|
|card_number   |integer|null: false                   |
|deadline_month|integer|null: false                   |
|deadline_year |integer|null: false                   |
|security_code |integer|null: false                   |
|user_id       |integer|null: false, foreign_key: true|
|item_id       |integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :addresses

## addressesテーブル
|Column        |Type      |Options                        |
|--------------|----------|------------------------------ |
|post_cord     |integer   |null: false                    |
|prefecture    |string    |null: false                    |
|city          |string    |null: false                    |
|block_number  |string    |null: false                    |
|building      |string    |null: false                    |
|phone_number  |integer   |null: false                    |
|purchases_id  |references|null,false, foreign_key: true  |

### Association
belongs_to :purchases