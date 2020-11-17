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

| Column           | Type    | options                 |
| -----------------| ------- | ----------------------- |
| nickname         | string  | null:false       |
| email            | string  | null:false, unque: true |
| password         | string  | null: false             |
| family_name      | string  | null: false             |
| first_name       | string  | null: false             |
| family_name_kana | string  | null: false             |
| first_name_kana | string  | null: false             |
| birth_year       | integer | null: false             |
| birth_month      | integer | null: false             |
| birth_day        | integer | null: false             |


### Association

- has_many :records
- has_many :products
- has_one :address

## products テーブル

| Column       | Type       | options      |
| ------------ | ---------  | ------------ |
| name         | string     | null: false  |
| text         | text       | null: false  |
| category     | string     | null: false  |
| condition    | string     | null: false  | 
| shipping     | string     | null: false  |
| region       | string     | null: false  |
| shipping_day | integer    | null: false  |
| price        | integer    | null: false  |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| purchase_date   | integer     | null: false,                   |
| user            | references  | null: false, foreign_key: true |
| products        | references  | null: false, foreign_key: true |

### Association

- belongs_to :products
- belongs_to :users

## address テーブル

| Column      | Type        | options                        |
| ----------  | ----------  | ------------------------------ |
| post_number | integer     | null: false                    |
| add1        | string      | null: false                    |
| add2        | string      | null: false                    |
| add3        | text        | null: false                    |
| add4        | text        |                                |
| tel         | integer     | null: false                    |
| user_id     | references  | null: false, foreign_key: true |

### Association

- belongs_to :user