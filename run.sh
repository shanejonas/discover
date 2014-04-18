#!/bin/bash
while ! curl http://$ETCD_1_PORT_4001_TCP_ADDR:$ETCD_1_PORT_4001_TCP_PORT/v2/keys
do
  echo "$(date) - still trying"
  sleep 1
done
echo "$(date) - connected successfully to etcd"

node ./index.js \
  --etcd:host $ETCD_1_PORT_4001_TCP_ADDR \
  --etcd:port $ETCD_1_PORT_4001_TCP_PORT \
  --docker:socketPath /docker.sock \
  --host:realm staging \
  --host:id battlefy \
  --verbose \
  --debug

