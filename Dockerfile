# ベースイメージを指定
FROM ruby:3.3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs yarn default-mysql-client

# 作業ディレクトリを設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerを実行
RUN bundle install

# アプリケーションのコードをコピー
COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]