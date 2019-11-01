FROM ruby:2.5.1
RUN apt-get update && apt-get install -y nodejs --no-install-recommends cron
RUN mkdir /app
WORKDIR /app
ADD Gemfile Gemfile.lock ./
RUN touch GemFile.lock
ENV RAILS_ENV='development'
RUN gem update --system
RUN gem install --default bundler -v 2.0.2
RUN bundler install
COPY . .
EXPOSE 3000
CMD sh -C "rake db:create db:migrate db:seed && puma -C config/puma.rb"