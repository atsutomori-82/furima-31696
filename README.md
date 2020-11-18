# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#テーブル設計

## users テーブル

| Column             | Type    | options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null:false       |
| email              | string  | null:false, unque: true |
| encrypted_password | string  | null: false             |
| family_name        | string  | null: false             |
| first_name         | string  | null: false             |
| family_name_kana   | string  | null: false             |
| first_name_kana    | string  | null: false             |
| birth_day          | integer | null: false             |


### Association

- has_many :records
- has_many :products
- has_one :address
- has_one :order


## products テーブル

| Column          | Type        | Options                        |
| --------------- | ----------  | ------------------------------ |
| name            | string      | null: false                    |
| text            | text        | null: false                    |
| category_id     | integer     | null: false                    |
| condition_id    | integer     | null: false                    | 
| shipping_id     | integer     | null: false                    |
| region_id       | integer     | null: false                    |
| shipping_day_id | integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| products        | references  | null: false, foreign_key: true |

### Association

- belongs_to :products
- belongs_to :users

## address テーブル

| Column            | Type        | options                        |
| ----------------  | ----------  | ------------------------------ |
| post_number       | string      | null: false                    |
| prefecture_id     | integer     | null: false                    |
| city              | string      | null: false                    |
| address           | string      | null: false                    |
| building          | string      |                                |
| tel               | string      | null: false                    |
| user              | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_tp :order