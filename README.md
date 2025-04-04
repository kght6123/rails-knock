# README

このリポジトリは、Ruby on Railsの学習を目的とした「100本ノック」形式の課題集です。特に、JavaやJavaScriptの経験がある方を対象に、Ruby on Railsの基本から応用までを段階的に学ぶことができるように設計されています。

## セットアップ

```bash
docker compose up -d
docker compose exec web rake db:create
```

http://localhost:3000

## 再ビルド

```bash
docker compose down
docker compose build
docker compose up -d
```

## 100本ノック形式の学習ステップ

Ruby on Rails 7を使い、RSpec、ERB/Slim、Active Recordという技術スタックで、JavaやJavaScriptの経験がある方を対象とした初心者からプロフェッショナルへの「100本ノック」形式の学習ステップを提案します。

実際に手を動かしながら進められるよう、各ステップを具体的なタスクとして示します。100個すべてを一度に提示するのではなく、段階的に区切って進めていきましょう。まずは最初の10ステップです。

**フェーズ1: 環境構築と基本の「Hello World」 (Knock 1-10)**

このフェーズでは、開発環境を整え、Railsアプリケーションの基本的な構造とリクエストの流れを理解します。

1〜3は、セットアップで実施済みのため、スキップします。

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


**フェーズ2: モデル(Active Record)、CRUD、静的解析、テスト (Knock 11-25)**

1.  **Knock 11: RuboCopの導入とコード整形**
    * **課題:** `Gemfile` に `rubocop` gem (および `rubocop-rails`, `rubocop-rspec` など関連gem) を追加し、`bundle install` します。プロジェクトルートで `bundle exec rubocop -A` コマンドを実行し、既存コードのスタイル違反を自動修正します。設定ファイル (`.rubocop.yml`) を作成し、基本的な設定（例: `AllCops/NewCops: enable`）を行います。
    * **確認:** `bundle exec rubocop` を実行し、大きな違反が報告されないことを確認します。
    * **Java/JS経験者向け:** JavaのCheckstyleやPMD、JavaScriptのESLintやPrettierに相当します。コードの一貫性を保つための重要なツールです。`-A`オプションは自動修正です。

2.  **Knock 12: モデルの生成 (Article)**
    * **課題:** ブログ記事を表す `Article` モデルを生成します。コマンドラインで `bin/rails generate model Article title:string content:text` を実行します。
    * **確認:** `app/models/article.rb` ファイルと `db/migrate/xxxxxxxxxxxxxx_create_articles.rb` というマイグレーションファイルが生成されていることを確認します。
    * **Java/JS経験者向け:** JavaのJPAにおけるEntityクラス、Node.jsのORMにおけるモデル定義に相当します。`title`は文字列型、`content`は長文テキスト型として定義されます。

3.  **Knock 13: マイグレーションの実行**
    * **課題:** `bin/rails db:migrate` コマンドを実行して、データベースに `articles` テーブルを作成します。
    * **確認:** `db/schema.rb` ファイルが更新され、`articles` テーブルの定義が追加されていることを確認します。エラーなくコマンドが完了することを確認します。
    * **Java/JS経験者向け:** JavaのFlywayやLiquibase、あるいは手動でのDDL実行に似ていますが、Railsではモデル定義からマイグレーションファイルを生成し、`db:migrate`で適用するのが一般的です。スキーマバージョンの管理も行われます。

4.  **Knock 14: Railsコンソールでのデータ操作**
    * **課題:** `bin/rails console` (または `rails c`) を起動し、Active Recordを使って `Article` のデータを作成、検索、更新、削除してみます。
        * 作成: `Article.create(title: "最初の記事", content: "こんにちは！")`
        * 検索(全件): `Article.all`
        * 検索(1件): `Article.find(1)` や `Article.find_by(title: "最初の記事")`
        * 更新: `article = Article.first; article.update(content: "更新しました。")`
        * 削除: `article = Article.first; article.destroy`
    * **確認:** 各コマンドが期待通りに動作し、データベースにデータが反映される（または削除される）ことを確認します。
    * **Java/JS経験者向け:** SQLクライアントで直接DBを操作する代わりに、Rubyのオブジェクトを通してDBを操作する感覚です。これがORM (Object-Relational Mapping) の基本です。

5.  **Knock 15: ArticlesコントローラーとIndexアクション**
    * **課題:** `bin/rails generate controller Articles index show new edit create update destroy` を実行して、`Articles`コントローラーと基本的なアクションの雛形、ビューファイルを作成します。まず `app/controllers/articles_controller.rb` の `index` アクションで `@articles = Article.all` と記述し、`app/views/articles/index.html.slim` で記事一覧を表示するようにします (例: `ul` タグと `each` ループを使用)。
    * **確認:** `/articles` (例: `http://localhost:3000/articles`) にアクセスし、コンソールで作成した記事（もしあれば）のタイトルなどが一覧表示されることを確認します。

6.  **Knock 16: ルーティングの変更 (resources)**
    * **課題:** `config/routes.rb` を開き、`get 'articles/index'` のような個別のルーティング定義を削除し、代わりに `resources :articles` と記述します。
    * **確認:** コマンドラインで `bin/rails routes` を実行し、`/articles` (index), `/articles/:id` (show), `/articles/new` (new), `/articles` (create, POST), `/articles/:id/edit` (edit), `/articles/:id` (update, PATCH/PUT), `/articles/:id` (destroy, DELETE) などの基本的なCRUDルーティングが一括で定義されていることを確認します。`/articles` にアクセスしても `index` が表示されることを確認します。
    * **Java/JS経験者向け:** Railsの強力な「設定より規約」の一例です。RESTfulなルーティングを一行で定義できます。

7.  **Knock 17: Showアクションの実装**
    * **課題:** `articles_controller.rb` の `show` アクションで `@article = Article.find(params[:id])` と記述します。`app/views/articles/show.html.slim` で記事のタイトル (`@article.title`) と本文 (`@article.content`) を表示するようにします。`index.html.slim` から各記事へのリンク (`link_to article.title, article_path(article)`) を追加します。
    * **確認:** `/articles` で記事タイトルをクリックすると、`/articles/:id` (例: `/articles/1`) に遷移し、該当記事の詳細が表示されることを確認します。
    * **Java/JS経験者向け:** URLパスパラメータ (`:id`) を受け取り、それを使ってデータを取得する、Webアプリケーションの基本的なパターンです。

8.  **Knock 18: New/Createアクションとフォームの実装**
    * **課題:**
        * `new` アクション: `@article = Article.new` を記述。
        * `new.html.slim`: `form_with(model: @article)` を使って記事投稿フォームを作成します (タイトルと本文の入力フィールド、送信ボタン)。
        * `create` アクション: `Article.new(article_params)` でデータを受け取り、`@article.save` で保存。保存成功時は記事一覧 (`articles_path`) へリダイレクト、失敗時は `new` テンプレートを再表示。Strong Parameters (`article_params` メソッド) を実装します。
        ```ruby
        # articles_controller.rb
        def create
          @article = Article.new(article_params)
          if @article.save
            redirect_to articles_path, notice: '記事を作成しました。' # noticeはフラッシュメッセージ
          else
            render :new, status: :unprocessable_entity # status指定が重要
          end
        end

        private

        def article_params
          params.require(:article).permit(:title, :content) # 受け取るパラメータを制限
        end
        ```
    * **確認:** `/articles/new` にアクセスしてフォームが表示されること。フォームを送信して記事が作成され、一覧にリダイレクトされることを確認します。フラッシュメッセージが表示されることも確認。
    * **Java/JS経験者向け:** HTMLフォームの扱い、POSTリクエストの処理、データの永続化、そしてリダイレクト。`form_with` はCSRF対策などを自動で行います。Strong Parametersは意図しないパラメータ（例: role='admin'など）が一括でモデルに渡されるのを防ぐセキュリティ機能 (Mass Assignment脆弱性対策) です。

9.  **Knock 19: Edit/Updateアクションの実装**
    * **課題:**
        * `edit` アクション: `@article = Article.find(params[:id])` を記述。
        * `edit.html.slim`: `form_with(model: @article)` を使って記事編集フォームを作成 (newとほぼ同じ)。
        * `update` アクション: `@article = Article.find(params[:id])` で記事を取得し、`@article.update(article_params)` で更新。成功時は記事詳細 (`article_path(@article)`) へリダイレクト、失敗時は `edit` テンプレートを再表示。
    * **確認:** 記事詳細ページや一覧ページに編集リンク (`link_to '編集', edit_article_path(article)`) を追加し、クリックして編集フォームが表示されること。フォームを送信して記事が更新され、詳細ページにリダイレクトされることを確認します。

10. **Knock 20: Destroyアクションの実装**
    * **課題:**
        * `destroy` アクション: `@article = Article.find(params[:id])` で記事を取得し、`@article.destroy` で削除。記事一覧 (`articles_path`) へリダイレクト。
        * 記事一覧 (`index.html.slim`) や詳細 (`show.html.slim`) に削除ボタンを追加します。`button_to` を使うのが一般的です: `button_to '削除', article_path(article), method: :delete, data: { turbo_confirm: '本当に削除しますか？' }`
    * **確認:** 削除ボタンをクリックし、確認ダイアログを経て記事が削除され、一覧ページにリダイレクトされることを確認します。`method: :delete` と `turbo_confirm` がポイントです (Rails 7では `turbo-rails` がデフォルトで入っているため)。

11. **Knock 21: フォームの共通化 (Partial)**
    * **課題:** `new.html.slim` と `edit.html.slim` のフォーム部分 (`form_with` から `end` まで) を `app/views/articles/_form.html.slim` というパーシャルファイルに切り出します。`new` と `edit` のビューでは `= render 'form', article: @article` のようにしてパーシャルを呼び出します。
    * **確認:** 新規作成画面、編集画面の両方が以前と同様に表示・動作することを確認します。
    * **Java/JS経験者向け:** JSPのインクルードや、React/Vueなどのコンポーネント化に相当します。コードの重複を避け、保守性を高めます (DRY: Don't Repeat Yourself)。ファイル名の先頭のアンダースコア `_` がパーシャルを示す規約です。

12. **Knock 22: モデルバリデーションの追加**
    * **課題:** `app/models/article.rb` にバリデーションを追加します。最低限、タイトルは必須入力とします。
        ```ruby
        class Article < ApplicationRecord
          validates :title, presence: true # タイトルが存在することを確認
          validates :content, presence: true, length: { minimum: 10 } # 本文が存在し、10文字以上であることを確認
        end
        ```
    * **確認:** `rails c` で `Article.create(title: "")` や `Article.create(title: "a", content: "short")` などが無効 (`save` が `false` を返す、`errors` オブジェクトにエラーメッセージが含まれる) であることを確認します。

13. **Knock 23: バリデーションエラーメッセージの表示**
    * **課題:** フォームパーシャル (`_form.html.slim`) の上部などに、バリデーションエラーが発生した場合にエラーメッセージ一覧を表示する処理を追加します。
        ```slim
        - if article.errors.any?
          .alert.alert-danger[role="alert"]
            h4 = "#{pluralize(article.errors.count, "error")} prohibited this article from being saved:"
            ul
              - article.errors.full_messages.each do |message|
                li = message
        ```
        また、`create` および `update` アクションで `render :new` や `render :edit` する際に `status: :unprocessable_entity` を付けていることを確認します（Knock 18, 19 で実施済みのはず）。
    * **確認:** 新規作成・編集フォームで、わざとバリデーション違反（例: タイトルを空にする）を起こして送信し、フォームが再表示され、エラーメッセージが表示されることを確認します。

14. **Knock 24: RSpec モデルスペックの作成**
    * **課題:** `bin/rails generate rspec:model Article` でモデルスペックファイルを生成（もしなければ）し、`spec/models/article_spec.rb` にバリデーションをテストするコードを記述します。
        ```ruby
        require 'rails_helper'

        RSpec.describe Article, type: :model do
          it "is valid with a title and content" do
            article = Article.new(title: "Valid Title", content: "This content is long enough.")
            expect(article).to be_valid
          end

          it "is invalid without a title" do
            article = Article.new(title: nil, content: "This content is long enough.")
            expect(article).not_to be_valid
            expect(article.errors[:title]).to include("can't be blank") # 具体的なエラーメッセージを確認
          end

          it "is invalid without content" do
            article = Article.new(title: "Valid Title", content: nil)
            expect(article).not_to be_valid
          end

          it "is invalid with short content" do
            article = Article.new(title: "Valid Title", content: "short")
            expect(article).not_to be_valid
            expect(article.errors[:content]).to include("is too short (minimum is 10 characters)")
          end
        end
        ```
    * **確認:** `bundle exec rspec spec/models/article_spec.rb` を実行し、すべてのテストがパスすることを確認します。

15. **Knock 25: RSpec リクエストスペックの作成 (CRUD)**
    * **課題:** `bin/rails generate rspec:request Articles` でリクエストスペックファイルを生成（もしなければ）し、`spec/requests/articles_spec.rb` にCRUD操作をテストするコードを記述します。（FactoryBot を導入するとテストデータ作成が楽になりますが、ここではまず手動で記述します）。
        ```ruby
        require 'rails_helper'

        RSpec.describe "Articles", type: :request do
          # FactoryBotを使うと let!(:article) { create(:article) } のように書ける
          let!(:article) { Article.create!(title: "Test Article", content: "This is test content long enough.") }
          let(:valid_attributes) { { title: "New Valid Title", content: "Updated content also long enough." } }
          let(:invalid_attributes) { { title: "", content: "short" } }

          describe "GET /index" do
            it "renders a successful response" do
              get articles_url
              expect(response).to be_successful # be_successful は 2xx を意味する
              expect(response.body).to include(article.title)
            end
          end

          describe "GET /show" do
            it "renders a successful response" do
              get article_url(article)
              expect(response).to be_successful
              expect(response.body).to include(article.content)
            end
          end

          describe "GET /new" do
            it "renders a successful response" do
              get new_article_url
              expect(response).to be_successful
            end
          end

          describe "GET /edit" do
            it "render a successful response" do
              get edit_article_url(article)
              expect(response).to be_successful
            end
          end

          describe "POST /create" do
            context "with valid parameters" do
              it "creates a new Article" do
                expect {
                  post articles_url, params: { article: valid_attributes }
                }.to change(Article, :count).by(1)
              end

              it "redirects to the articles list" do
                post articles_url, params: { article: valid_attributes }
                expect(response).to redirect_to(articles_url) # 一覧へリダイレクト
              end
            end

            context "with invalid parameters" do
              it "does not create a new Article" do
                expect {
                  post articles_url, params: { article: invalid_attributes }
                }.to change(Article, :count).by(0)
              end

              it "renders the 'new' template again (with unprocessable_entity status)" do
                post articles_url, params: { article: invalid_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response).to render_template(:new) # Rails 7のデフォルト挙動確認
              end
            end
          end

          describe "PATCH /update" do
            context "with valid parameters" do
              it "updates the requested article" do
                patch article_url(article), params: { article: valid_attributes }
                article.reload # DBから最新の状態を読み込む
                expect(article.title).to eq("New Valid Title")
                expect(article.content).to eq("Updated content also long enough.")
              end

              it "redirects to the article" do
                patch article_url(article), params: { article: valid_attributes }
                expect(response).to redirect_to(article_url(article)) # 詳細へリダイレクト
              end
            end

            context "with invalid parameters" do
              it "renders the 'edit' template again (with unprocessable_entity status)" do
                patch article_url(article), params: { article: invalid_attributes }
                expect(response).to have_http_status(:unprocessable_entity)
                expect(response).to render_template(:edit) # Rails 7のデフォルト挙動確認
              end
            end
          end

          describe "DELETE /destroy" do
            it "destroys the requested article" do
              expect {
                delete article_url(article)
              }.to change(Article, :count).by(-1)
            end

            it "redirects to the articles list" do
              delete article_url(article)
              expect(response).to redirect_to(articles_url)
            end
          end
        end
        ```
    * **確認:** `bundle exec rspec spec/requests/articles_spec.rb` (または `bundle exec rspec`) を実行し、すべてのテストがパスすることを確認します。
    * **Java/JS経験者向け:** SpringのMockMvcを使ったControllerテストや、Node.jsでSupertestを使ったAPIテストに似ています。HTTPリクエストをシミュレートし、レスポンスコード、リダイレクト先、レンダリングされるテンプレート、DBの状態変化などを検証します。

