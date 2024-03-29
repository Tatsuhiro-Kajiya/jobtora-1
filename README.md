# Jobtora
<img width="1680" alt="スクリーンショット 2021-03-02 18 57 20" src="https://user-images.githubusercontent.com/75005529/109631328-32537b80-7b89-11eb-81a5-9ac8028715d1.png">

# ポートフォリオの概要
**近年大幅に増加した在宅勤務の方向けにワーキングスポット、ワーケーションスポットを紹介する情報投稿アプリを作成しました。**  
ワーケーションとは、ワーク(仕事)　＋　バケーション(休暇)　を掛け合わせた造語  
普段の職場と異なるリゾート地や観光地で働きながら休暇を取ることである。ノートPCやスマートフォンなどを利用して、場所にとらわれずに仕事を行うスタイルをいいます。

# ポートフォリオのURL
**http://tka.jobtora-32575.com/**

# ポートフォリオ作成のペルソナ
20代〜50代男女で職場がリモートワークへ移行している業種で働く人たちをメインに利用することを想定。  
リモートワークで自宅環境を整えたとしても、ずっと同じ環境での仕事はどうしても飽きがきてしまうもの、海や山など自然の近くの静かな場所で働いてリフレッシュしながら、
普段は触れ合うことが少ない人と出会う、観光名所で感動する、そんな体験が仕事の良いアイデアにつながる。

# 開発環境
MAC  
・VScode  
・Ruby 2.6.5  
・Ruby on Rails 6.0.3.4  
・MySQL  
・Nginx  
・AWS(S3, EC2, Route53)  
・Capistrano  
・RSpec  
・Github  

# ポートフォリオの使用方法
・トップページからユーザー新規登録・ログイン・ゲストログインを行う  
・トップページのNEW SPOT LISTからワーキングスポット、ワーケーションスポットを閲覧でき、コメント投稿を行える  
・SPOT投稿から新規でのワーキング、ワーケーションスポットの投稿が行える  
・自分が投稿した情報の編集と削除を行える  

# 機能一覧
|機能|概要|
|:---|:---|
|ユーザー管理機能|新規投稿・ログイン・ログアウトが行える|
|投稿機能|画像付きでワークスポットを投稿できる|
|投稿詳細機能|各ワークスポットの投稿詳細ページが閲覧できる|
|投稿編集・削除機能|ログイン中のユーザーでアカウント本人であれば投稿編集・削除が可能|
|コメント機能|投稿詳細ページからコメントが可能|
|投稿検索機能|トップページからワークスポットの検索が可能|
|マイページ機能|ログイン中のユーザー情報が閲覧できる|
|投稿画像プレビュー機能｜SPOT投稿ページで選択した画像を非同期表示で確認
できる｜
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