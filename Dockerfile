FROM ruby

# rails requires some kind of javascript run-time
RUN apt-get update && apt-get install -y nodejs && apt-get clean

RUN apt-get --assume-yes install redis-server

RUN chmod 555 run

COPY ./ /app/

EXPOSE 80

CMD ["/app/run"]
