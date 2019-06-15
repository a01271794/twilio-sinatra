FROM ruby:2.5-alpine
LABEL maintainer="antonio@almavios.com"
RUN apk --update add --virtual build-dependencies build-base \
  git
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3
RUN apk del build-dependencies \
  && rm -rf /var/cache/apk/* 
COPY . .
EXPOSE 4567
CMD ["ruby", "index.rb"]
