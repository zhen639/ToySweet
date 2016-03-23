FROM ruby

# rails requires some kind of javascript run-time
RUN apt-get update && apt-get install -y nodejs && apt-get clean

RUN apt-get --assume-yes install redis-server

COPY ./ /app/

EXPOSE 80

CMD ["/app/run"]
