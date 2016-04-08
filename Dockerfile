FROM ruby

# rails requires some kind of javascript run-time
RUN apt-get update && apt-get install -y nodejs && apt-get clean

RUN apt-get --assume-yes install redis-server

COPY Gemfile* /tmp/
RUN cd /tmp/ && ls
RUN cd /tmp/ && bundle install --verbose --without=development
WORKDIR /app

COPY ./ /app/

EXPOSE 80
EXPOSE 3000

CMD ["/app/run"]
