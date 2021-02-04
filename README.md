# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| age         | string |             |


### Association

- has_many :spots
- has_many :comments

## spots テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| -------------------------------|
| name           | string     | null: false                    |
| genre_id       | integer    | null: false                    |
| place_id       | integer    | null: false                    |
| explanation    | text       | null: false                    |
| plan           | text       |                                |
| wifi_id        | integer    | null: false                    |
| budget         | string     |                                |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| evaluation_id | integer    |                                |
| review        | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| spot          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :spot