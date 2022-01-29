FROM ruby:3.0.3
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /myChat
COPY Gemfile /myChat/Gemfile
COPY Gemfile.lock /myChat/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /myChat
