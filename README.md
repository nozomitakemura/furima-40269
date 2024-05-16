# テーブル設計

## users テーブル

| Column             | Type   | Options                              |
| ------------------ | ------ | -----------------------------------  |
| nick_name          | string | null: false                          |
| email              | string | null: false, unique: true            |
| encrypted_password | string | null: false, default:""              |
| first_name         | string | null: false                          |
| family_name        | string | null: false                          |
| first_name_kana    | string | null: false                          |
| family_name_kana   | string | null: false                          |
| birth_day          | date   | null: false                          |


### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ----------                     |
| user                 | references | null: false, foreign_key: true |
| product_name         | string     | null: false                    |
| product_explanation  | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| contribution_id      | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_time_id     | integer    | null: false                    |
| price                | references | null: false                    |


### Association

- belongs_to :user
- hus_one :order

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- hus_one :address

## addresses テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| postcode         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| block            | string     | null: false                    |
| building_name    | text       |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :order
