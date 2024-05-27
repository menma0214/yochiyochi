FROM ruby:3.2.2
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq \
&& apt-get install -y ca-certificates curl gnupg \
&& mkdir -p /etc/apt/keyrings \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
&& NODE_MAJOR=19 \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libmariadb-dev nodejs yarn
RUN mkdir /graduation_exhibition_original_application
WORKDIR /graduation_exhibition_original_application
RUN gem install bundler:2.5.3
COPY Gemfile /graduation_exhibition_original_application
COPY Gemfile.lock /graduation_exhibition_original_application
COPY yarn.lock /graduation_exhibition_original_application
RUN bundle install
RUN yarn install
COPY . /graduation_exhibition_original_application