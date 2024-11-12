# 👶サービス名：Yochiyochi/よちよち(卒業制作)
[![Image from Gyazo](https://i.gyazo.com/6581e07b97fc0872d88e6363106b002e.png)](https://gyazo.com/6581e07b97fc0872d88e6363106b002e)


## 📖サービス概要
- 小さなお子様とのお出かけスポットを検索できるサービス。
- [サービス概要](https://yochiyochi.onrender.com/)

## 🚗このサービスへの思い・作りたい理由
私にはまだ歩き出したばかりの息子がいます。
そんな小さな子どもでも毎回似たような遊具、もしくは年齢にそぐわない遊具しかない公園では退屈するかと考え、様々な場所に連れ出してあげたいという思いが強まりました。
また、様々な理由で両親が離婚や別居中になってしまったお宅のお子様が面会交流を実施する際に利用できる場所も限られると感じました。
子供の特徴や住所などに合わせて簡単にお出かけ先を検索できたら楽で安全性も確認できたら便利だと感じ、今回このアプリの作成に至りました。

## 👦ユーザー層について
0~3歳ほどの子供の場合は特に急に予測不可能な行動をするために目を離せないこと、また遊園地などの一般的に思い描くテーマパークでは身長や年齢制限で利用できないアトラクションが多いためです。

## 🔍サービスの利用イメージ
- ユーザーである親は子供の【年齢】、【性別】、【性格】、【遊具や玩具の好み】、【遊び方の傾向】やユーザーの【アクセス】等の要望から簡単にお出かけスポット検索できる。
- 検索し、気に入ったお出かけスポットはブックマーク機能で保存することでいつでも確認ができる。
- ユーザーのレビューを参考にすることができる
- 特に可愛くて仕方がないこの時期に、家族で思い出が残せるというこの一瞬でしか作れない特別な価値を得られる

## 📱ユーザーの獲得について
- youtubeやsnsにて拡散
- 小さな子どもがおり、顧客を多く抱えている知り合いに利用、流布を依頼。
- 職場の人間に流布

## 🧸サービスの差別化ポイント・推しポイント
- 他サービスだと検索結果がイベントやPR、スポット名、口コミが入り乱れてわかりにくいが、当サービスではスポット、イベント情報は分けたUIを実装。
- 屋内施設と屋外施設で絞り込みが可能。
- レビューは閲覧したユーザーと施設関係者への配慮し、NGワードを設定。
- レビューの投稿には低く偏った意見を防止するために、良い点を必ず記載するように実装。
- 遊具、アトラクション情報からも検索可能
- 子どもの年齢以外の特徴からスポットやイベントの検索が可能。

# 💻技術スタック

| カテゴリー | 使用技術 |
|---------| --------|
| プログラミング言語 | Ruby 3.2.2 |
| フレームワーク| Ruby on Rails 7.0.8, bootstrap, jquery, stimulus |
| フロントエンド | HTML, CSS, javascript|
| データベース | postgresql |
| ファイルサーバー | AWS S3 |
| 開発ツール | Docker 24.0.7, Github, Rspec |

## ⭐️実装機能
| 会員登録機能 |
|---------|
| [![Image from Gyazo](https://i.gyazo.com/85613a72e45b9d2805b8b2c381473950.gif)](https://gyazo.com/85613a72e45b9d2805b8b2c381473950) |
| ニックネーム、メールアドアレス、パスワードで会員登録機能実装。ログインユーザーのロールでログアウト時の遷移先ページが切り替わるように実装。 |

| 検索機能 |
|---------|
| [![Image from Gyazo](https://i.gyazo.com/c6e5530f8a36cf0e6a24a5fde4e5de70.gif)](https://gyazo.com/c6e5530f8a36cf0e6a24a5fde4e5de70) |
| オートコンプリート機能を実装。曖昧検索(ransack)、タグ、料金での検索機能、都道府県からの検索機能を実装。 検索結果は一覧をタイル型レイアウトで実装し、カーソル先をホバーさせて選択記事がわかりやすいようにUI調整。|

| 診断機能 |
|---------|
| [![Image from Gyazo](https://i.gyazo.com/1a4b8ea9f9ff5cd390d98cbddcb934ab.gif)](https://gyazo.com/1a4b8ea9f9ff5cd390d98cbddcb934ab) |
| ユーザー登録時に4ステップのアンケートを実施。アンケート結果に合わせたおすすめスポットを表示。(socery) |


## 🤖機能候補


- 施設場所の確認のためのマップ機能(geocoder,マップ表示はajax)
- レビュー投稿、星で評価(星は追加予定案)
- ブックマーク（Ajax）
- 施設情報に画像と動画を掲載(bootstrap)
- ページネーション(kaminari)

## 🔧機能の実装方針予定
- ユーザー（の子供）全体から施設利用者の年齢層の統計をグラフで表示
- 検索履歴の保存機能
- 公式のYouTube、SNS埋め込み機能(bootstrap)
- 都度追加予定

## 🖥️画面遷移図
https://www.figma.com/file/N6O6fXTn5YilXZFHf47uAw/RUNTEQ%E5%8D%92%E6%A5%AD%E5%88%B6%E4%BD%9C%EF%BC%88%E5%B9%BC%E5%85%90%E5%90%91%E3%81%91%E9%81%8A%E3%81%B3%E5%A0%B4%E3%82%B9%E3%83%9D%E3%83%83%E3%83%88%EF%BC%89?type=whiteboard&node-id=0%3A1&t=WhBdwdQSazSIUhDB-1


## 🗺️ER図
https://app.diagrams.net/#G1WHDlPJpQZt4h_oao_zqkZSx0oLP7F5u2#%7B%22pageId%22%3A%22R2lEEEUBdFMjLlhIrx00%22%7D
