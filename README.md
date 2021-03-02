# Jobtora
![ダミー画像](https://gyazo.com/8884ca33751f985643832f31e80321b5)

# ポートフォリオの概要
近年大幅に増加した在宅勤務の方向けにワーキングスポット、ワーケーションスポットを紹介する情報投稿アプリを作成しました。
※ワーケーションとは、ワーク(仕事)　＋　バケーション(休暇)　を掛け合わせた造語
 普段の職場と異なるリゾート地や観光地で働きながら休暇を取ることである。ノートPCやスマートフォンなどを利用して、場所にとらわれずに仕事を行うスタイルをいいます。

# ポートフォリオ作成のペルソナ
20代〜50代男女で職場がリモートワークへ移行している業種で働く人たちをメインに利用することを想定。  
リモートワークで自宅環境を整えたとしても、ずっと同じ環境での仕事はどうしても飽きがきてしまうもの、海や山など自然の近くの静かな場所で働いてリフレッシュしながら、
普段は触れ合うことが少ない人と出会う、観光名所で感動する、そんな体験が仕事の良いアイデアにつながる。

# 開発環境
MAC
開発言語: HTML, CSS, Ruby, Ruby on Rails, MySQL, AWS(S3,EC2)

# ポートフォリオの使用方法
・トップページからユーザー新規登録・ログイン・ゲストログインを行う  
・トップページのNEW SPOT LISTからワーキングスポット、ワーケーションスポットを閲覧でき、コメント投稿を行える  
・SPOT投稿から新規でのワーキング、ワーケーションスポットの投稿が行える  
・自分が投稿した情報の編集と削除を行える  

# 機能一覧
|*機能*|*概要*|  
|---------------｜---------------------------------------------------------|  
|ユーザー管理機能|新規投稿・ログイン・ログアウトが行える|  
|投稿機能|画像付きでワークスポットを投稿できる|  
|投稿詳細機能|各ワークスポットの投稿詳細ページが閲覧できる|  
|投稿編集・削除機能|ログイン中のユーザーでアカウント本人であれば投稿編集・削除が可能|  
|コメント機能|投稿詳細ページからコメントが可能|  
|投稿検索機能|トップページからワークスポットの検索が可能｜

# テーブル設計
## users テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| nickname      | string     | null: false                     |
| last_name     | string     | null: false                     |
| first_name    | string     | null: false                     |
| email         | string     | null: false                     |
| password      | string     | null: false                     |
| age           | string     |                                 |


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

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| title         | string      | null: false                    |
| evaluation_id | integer     | null: false                    |
| review        | text        | null: false                    |
| user          | references  | null: false, foreign_key: true |
| spot          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :spot