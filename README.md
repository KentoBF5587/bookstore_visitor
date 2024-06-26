
# README

# bookstore_visitor （タイトルは仮名です）

## ■ サービス概要

本屋を訪れるのが好きな方を対象にしたサービス。ユーザーにとっての”推し本屋”を見つける手助けをします。本屋を検索し、その本屋に対して”どんなところが好きか”を投稿できます。行ってみたい本屋を見つけたら自身のアカウントに”行ってみたい本屋”としてブックマークを保存し、確認することも可能です。

## ■ このサービスへの思い、作りたい理由

「書店が10年間で764社が倒産」、「現在書店がない市町村は全国の約26%」と書店に関しての悲しいニュースをよく耳にします。一方で、「本屋が好き」「本屋で知らない本に出会うのが好き」という意見もまだまだあります。

書店は「紙の本を手に入れるところ」に留まらず、「1つの楽しめるスポット」という要素があるのではと思います。

　書店員によって陳列された本のラインナップを見て、当初は買う予定のなかった本をレジに持って行ってしまう方も多いのではないでしょうか。あるいは、観光地で記念スタンプを押す楽しみがあるように、普段行かない本屋で買った本が思い出に残るという事もあるのではないでしょうか。

「販売スペースのラインナップ」、「居心地の良さ」、「ユニークな試み」など人によって本屋の好きなところは様々だと思うので、「どんなところが好きか」を共有していければと思います。

自分も「書店でどの本をカゴに入れるか」迷ったりする時間が好きなので、書店に思い入れがある1人としてこのアプリを作ってみたいと考えました。

## ■ ユーザー層について

書店が好きな方

　”読書”というよりも今回は”本屋”がアプリのテーマになっているので選びました。本屋で過ごす時間が好き、珍しい本屋に行ってみたいと思う方向けのサービスです。

## ■ サービスの利用イメージ

ログインなし

    当アプリに保存された書店の情報やレビューの閲覧。

ログインあり

    書店のレビューを作成可能。
    ※Filmarksの「1作品にいくつものレビュー」のように「1書店につきいくつものレビュー」が付けられればと思います。
    レビューへの返信機能も興味深いですが、付けるとしても実装は後回しにする予定です。

    アプリに載っていない書店がある場合は、新規登録する機能も考えています。

    ユーザーページには自己紹介欄を設け、「おすすめの本屋」や「行ってみたい本屋」を自分のページに登録出来ます。

    「おすすめの本屋」にて買った本があれば任意で記録出来ます。

    自己紹介欄に任意でXなどのSNSアカウントを貼り付けることも可能になり、これをきっかけに本好きの別のユーザーと繋がりやすくする工夫が取り入れられたらと思います。

## ■ ユーザーの獲得について

SNSを読書アカウントとして利用している方を中心に、X などで呼びかけていく予定です。

## ■ サービスの差別化ポイント・推しポイント

本屋の検索はGoogleなどで条件や書店名を調べたら簡単に出てきます。

そちらと差別化を図るために、

タグ検索（タグ一覧を表示するページを必要なら設ける）を取り入れる。

例. 「関東」「〇〇に強い（具体的なジャンルを入れて個別に作るかは検討中）」「ポップがユニーク」「広い」「落ち着く」「イベント開催あり」「買った本をすぐ読める」「ラインナップがユニーク」「個人経営」「カフェなどが併設」「アクセスが良い」「メディアで紹介（雑誌・TV・有名なブログなど）」

※悩んでいる点その1→これはお店に紐づけるか、レビューにつけるか（”レビューに「〇〇」というタグが付いている本屋”を検索することが出来るか）

※悩んでいる点その2→タグは管理者のみ新規登録するべきか

（当初は「ネガティブ、あるいは本屋の説明に当てはまらないタグを作成するのはご遠慮ください」と注意書きをした上で、ユーザーも新規タグを作れるように出来ることを想定していました）

「本屋のレビューページ」をユーザーが書いていて楽しくなるような仕組みを取り入れていきます。

現段階で取り入れようと考えているのは、「自己紹介カード」のような形になるレビューです。なるべくライトな質問をあらかじめ用意し、それに答えてもらうとカードのようなものが出来上がるイメージです。

例. 「〇〇書店について（ここは選んだ本屋の名前が自動的に入力されるようにする）」「かいた日」「この本屋と出会ったきっかけは？」「初めて行ったのはいつ頃？」「どんなところが好き？（テキスト入力するか、もしくはここでタグをユーザーに選んでもらうか）」「この本屋にキャッチコピーをつけるとしたら？」「推し本屋の愛を自由に書いて！」

ユーザーは好きな本屋を「おすすめの本屋」として登録することができ、そこに任意で”その本屋でどの本を買ったか”を登録することもしたいです。

## ■ 機能候補

MVPリリース

- ユーザー登録機能

- プロフィール作成・編集機能

- 書店登録・検索機能

- ログイン機能（別のSNSアカウントと連携させることで登録できる機能）

- 本屋レビュー機能

- 登録された本屋に対して、「おすすめの本屋」「行ってみたい本屋」という名前でブックマークする機能

- 「おすすめの本屋」に紐づけてそこで買った本屋を登録できる機能

- ユーザーのプロフィール欄に紐付けて、「おすすめの本屋（レビューした本屋）」「行ってみたい本屋」を表示

- 利用規約

- レスポンシブ対応



本リリース

- ユーザーのプロフィールページの機能追加


    「プロフィール欄」を設けて、簡単に自己紹介文を書き込める機能の追加も予定しています。

    余裕があれば、プロフィールページのレイアウト（壁紙機能）を5パターンほど設定してユーザーがその中から選択できる機能も候補の1つです。

- 本屋のレビュー文章に高評価ボタンをつける機能

    Filmarksの映画の感想文へのハートマークを表示する機能に近いものを想定しています。

- 診断ページ

    ユーザーにいくつか質問をして、質問結果に応じて有名な本屋を紹介する診断アプリの簡易版の作成。

    まずは10店舗くらいに分けらればと思います。

- LINEBOT

    面白そうなので、余裕があれば取り入れてみたいです。どのように使うかは未定。

## ■ 機能の実装予定

▪️開発環境：Docker

▪️サーバーサイド：Ruby on Rails 7系

Ruby 3.2.2　Rails 7.1.3.2

▪️フロントエンド：Hotwire

▪️CSSフレームワーク：Bootstrap5系

▪️WebAPI：GoogleMapAPI→書店一覧を表示

楽天ブックス書籍検索APIもしくはGoogle Books APIs→買った本を検索ために必要

▪️インフラ

Webアプリケーションサーバー：Fly.ioもしくはHeroku→PaaS

ファイルサーバー：今の所予定なし（画像を大量に使うとなるとAWS S3？）

データベースサーバ：PostgreSQL→本番環境にも使えるSQL

▪️その他

VSC：GitHub

rubocop

Xログイン、LINEログイン→ログイン機能に使うことが出来れば良さそう

### 画面遷移図
Figma:https://www.figma.com/file/e1JOvfTRraI07AInM1CVNz/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0-1&mode=design&t=r8YJaMB9n1libCFU-0

### ER図
draw.io: https://app.diagrams.net/#G1Dd2jxO4JVnGLgIRyG7FojvgRva0GJIDr#%7B%22pageId%22%3A%22C5RBs43oDa-KdzZeNtuy%22%7D