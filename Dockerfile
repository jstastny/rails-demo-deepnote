FROM ruby:2.6.3 AS base
RUN apt-get update -qq && apt-get install -y nodejs
#RUN gem install bundler
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]


FROM base
RUN apt-get update -qq && apt-get install -y python3 python3-pip
RUN apt-get update -qq && apt-get install -y libtool libffi-dev make libzmq3-dev libczmq-dev
RUN gem install ffi-rzmq
RUN gem install iruby --pre
RUN ln -s $(which python3) /usr/local/bin/python
RUN ln -s $(which pip3) /usr/local/bin/pip
ENV DEFAULT_KERNEL_NAME=ruby
