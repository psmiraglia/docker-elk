#!/bin/bash

_ZK_HOST=${ZK_HOST:-"localhost"}
_ZK_PORT=${ZK_PORT:-"2181"}

${KAFKA_HOME}/bin/kafka-server-start.sh \
    ${KAFKA_HOME}/config/server.properties \
    --override zookeeper.connect=${_ZK_HOST}:${_ZK_PORT}
