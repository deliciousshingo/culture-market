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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| ----------| ------ | ----------- |
| name | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile | text | null: false |

### Association

- has_many : dances
- has_many : yogas
- has_many : workouts
- has_many : messages
- has_many : comments


## dances テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| genre_id | integer | null: false |
| price   | integer | null: false |
| introduce   | text | null: false | 
| reservation_time | time | null: false |  
| user  | references | null: false, foreign_key: true |

### Association

- has_many : comments
- has_one : orders
- belongs_to : user

## yogas テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| genre_id | integer | null: false |
| price   | integer | null: false |
| introduce   | text | null: false | 
| reservation_time | time | null: false |  
| user  | references | null: false, foreign_key: true |

### Association

- has_many : comments
- has_one : orders
- belongs_to : user

## workouts テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title   | string | null: false |
| genre_id | integer | null: false |
| price   | integer | null: false |
| introduce   | text | null: false | 
| reservation_time | time | null: false |  
| user  | references | null: false, foreign_key: true |

### Association

- has_many : comments
- has_one : orders
- belongs_to : user

## orders テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user  | references | null: false, foreign_key: true |
| dance  | references | null: false, foreign_key: true |
| yoga  | references | null: false, foreign_key: true |
| workout  | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : dance
- belongs_to : yoga
- belongs_to : workout

## messages テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| message  | text | null: false |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to : user


## comments テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| comment  | text | null: false |
| user  | references | null: false, foreign_key: true |
| dance  | references | null: false, foreign_key: true |
| yoga  | references | null: false, foreign_key: true |
| workout  | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : dance
- belongs_to : yoga
- belongs_to : workout
