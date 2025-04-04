# README

このリポジトリは、Ruby on Railsの学習を目的とした「100本ノック」形式の課題集です。特に、JavaやJavaScriptの経験がある方を対象に、Ruby on Railsの基本から応用までを段階的に学ぶことができるように設計されています。

## セットアップ

```bash
docker compose up -d
docker compose exec web rake db:create
```

http://localhost:3000

## 100本ノック形式の学習ステップ

Ruby on Rails 7を使い、RSpec、ERB/Slim、Active Recordという技術スタックで、JavaやJavaScriptの経験がある方を対象とした初心者からプロフェッショナルへの「100本ノック」形式の学習ステップを提案します。

実際に手を動かしながら進められるよう、各ステップを具体的なタスクとして示します。100個すべてを一度に提示するのではなく、段階的に区切って進めていきましょう。まずは最初の10ステップです。

**フェーズ1: 環境構築と基本の「Hello World」 (Knock 1-10)**

このフェーズでは、開発環境を整え、Railsアプリケーションの基本的な構造とリクエストの流れを理解します。

1.  **Knock 1: RubyとRailsのインストール**
    * **課題:** Ruby 3.x と Rails 7.x をローカルマシンにインストールしてください。`rbenv` や `asdf` などのバージョン管理ツールを使うことを推奨します。
    * **確認:** コマンドラインで `ruby -v` と `rails -v` を実行し、意図したバージョンが表示されることを確認します。
    * **Java/JS経験者向け:** JavaのJDKインストールやNode.jsのインストールに相当します。バージョン管理ツールは`nvm`やSDKMAN!に似ています。

2.  **Knock 2: 新規Railsアプリケーションの作成**
    * **課題:** `rails new my_first_app --database=postgresql` コマンドを実行して、新しいRailsアプリケーションを作成します。（データベースはPostgreSQLを推奨しますが、難しければ最初はデフォルトのSQLiteでもOKです）。
    * **確認:** `my_first_app` ディレクトリが作成され、中に多くのファイルとディレクトリが生成されていることを確認します。
    * **Java/JS経験者向け:** Spring Initializrや`create-react-app`, `vue create`などでプロジェクトスケルトンを作成するのに似ています。Railsは最初から多くの規約に基づいた構造を持ちます。

3.  **Knock 3: Railsサーバーの起動**
    * **課題:** 作成した `my_first_app` ディレクトリに移動し、`bin/rails server` (または `rails s`) コマンドを実行して開発用サーバーを起動します。
    * **確認:** ブラウザで `http://localhost:3000` を開き、Railsのデフォルトのウェルカムページが表示されることを確認します。
    * **Java/JS経験者向け:** Tomcat/Jettyサーバーの起動や`npm start` / `yarn dev`に相当します。

4.  **Knock 4: 静的なページの作成 (Pagesコントローラー)**
    * **課題:** `bin/rails generate controller Pages home` コマンドを実行して、`Pages`コントローラーと`home`アクション、対応するビューファイルを作成します。
    * **確認:** `app/controllers/pages_controller.rb` に `home` メソッドが、`app/views/pages/home.html.erb` ファイルが生成されていることを確認します。
    * **Java/JS経験者向け:** JavaのServlet/Controllerクラス、JavaScriptフレームワークのコンポーネント生成に似ています。Railsの`generate`コマンドは定型コードを自動生成する強力なツールです。

5.  **Knock 5: ルーティングの設定**
    * **課題:** `config/routes.rb` ファイルを開き、ルートパス (`/`) にアクセスした際に `Pages`コントローラーの`home`アクションが表示されるように設定します (`root "pages#home"` のように記述)。
    * **確認:** `bin/rails server` を再起動（または起動したままなら自動でリロードされる場合が多い）し、 `http://localhost:3000` にアクセスして、先ほど作成した `Pages#home` の内容（デフォルトでは`Pages#home Find me in app/views/pages/home.html.erb`のようなテキスト）が表示されることを確認します。
    * **Java/JS経験者向け:** Springの`@RequestMapping`やExpress.jsの`app.get('/')`に相当します。`routes.rb`でURLとコントローラーアクションを紐付けます。

6.  **Knock 6: ビュー(ERB)の編集**
    * **課題:** `app/views/pages/home.html.erb` ファイルを開き、内容を「Hello, Rails!」のような簡単なHTMLに変更します。
    * **確認:** ブラウザで `http://localhost:3000` をリロードし、変更した内容が表示されることを確認します。
    * **Java/JS経験者向け:** JSPやThymeleaf、ReactのJSXやVueテンプレートの編集に似ています。ERBはHTML内にRubyコードを埋め込むテンプレートエンジンです。

7.  **Knock 7: コントローラーからビューへのデータ渡し**
    * **課題:** `app/controllers/pages_controller.rb` の `home` アクション内でインスタンス変数 (`@message = "こんにちは、Rails!"`) を定義し、`app/views/pages/home.html.erb` でその変数を表示 (`<%= @message %>`) させます。
    * **確認:** ブラウザをリロードし、「こんにちは、Rails!」が表示されることを確認します。
    * **Java/JS経験者向け:** Javaの`request.setAttribute()`や`Model.addAttribute()`、JavaScriptフレームワークの`props`や`state`をテンプレートに渡す感覚に近いです。インスタンス変数 (`@`) がビューに渡されます。

8.  **Knock 8: RSpecのセットアップ**
    * **課題:** `Gemfile` に `rspec-rails` gemを追加し、`bundle install` を実行します。その後、`bin/rails generate rspec:install` を実行してRSpecの設定ファイルを生成します。
    * **確認:** `spec` ディレクトリと関連ファイル (`spec/rails_helper.rb`, `spec/spec_helper.rb`, `.rspec`) が生成されていることを確認します。
    * **Java/JS経験者向け:** `pom.xml`や`build.gradle`にJUnitを追加したり、`package.json`にJestやMochaを追加するのに相当します。`bundle install`は依存関係を解決・インストールします。

9.  **Knock 9: 最初のRSpecテスト (リクエストスペック)**
    * **課題:** `Pages#home` アクションが正常に表示されることを確認する簡単なリクエストスペックを作成します (`spec/requests/pages_spec.rb` など)。`get root_path` でリクエストを送り、`expect(response).to have_http_status(:success)` でステータスコードを確認します。
    * **確認:** コマンドラインで `bundle exec rspec` を実行し、テストがパスすることを確認します。
    * **Java/JS経験者向け:** JUnitのテストクラスやJest/Mochaの`describe`/`it`ブロックに似ています。リクエストスペックはエンドツーエンドに近い形でコントローラーの挙動をテストします。

10. **Knock 10: Slimテンプレートエンジンの導入と利用**
    * **課題:** `Gemfile` に `slim-rails` gemを追加し、`bundle install` を実行します。`app/views/pages/home.html.erb` を `app/views/pages/home.html.slim` にリネームし、Slimの記法で同じ内容（例: `h1 Hello, Slim!` と `@message`の表示）を記述します。
    * **確認:** ブラウザで `http://localhost:3000` をリロードし、ERBの時と同じように表示されることを確認します。
    * **Java/JS経験者向け:** Pug (旧Jade) や他のインデントベースのテンプレートエンジンを使ったことがあれば似ています。ERBよりも簡潔に書けるのが特徴です。ファイル拡張子でRailsが自動的に適切なエンジンを使います。

