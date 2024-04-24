# 使いたいRubyのバージョン
ARG RUBY_VERSION="3.2.2"
FROM ruby:${RUBY_VERSION}

# 使いたいNodeのバージョン
ARG NODE_VERSION="20.10.0"

# fly.tomlで設定したことの反映
ENV USER=plugh
ENV MODE=production

# UTF-8とタイムゾーンの設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Dockerイメージをビルドする際にNode.jsとYarnをインストールするためのもの
RUN curl -sL https://deb.nodesource.com/setup_${20.10.0}.x | bash - \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn

# ディレクトリを作る
RUN mkdir /bookstore_visitor
WORKDIR /bookstore_visitor

# bundlerのインストール
RUN gem install bundler

# gemfileなどのコピー
COPY Gemfile /bookstore_visitor/Gemfile
COPY Gemfile.lock /bookstore_visitor/Gemfile.lock
COPY yarn.lock /bookstore_visitor/yarn.lock

# bundleとyarnをインストール
RUN bundle install
RUN yarn install

# アプリケーションのコピー
COPY . /bookstore_visitor