FROM dockerfile/nodejs

RUN apt-get install -y build-essential
RUN apt-get install -y python

ADD ./package.json /app/package.json

RUN cd /app; npm install .

ADD . /app

WORKDIR /app

RUN chmod 755 ./run.sh

CMD ["./run.sh"]

