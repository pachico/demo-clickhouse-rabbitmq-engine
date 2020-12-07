#!/bin/bash
# Publish dummy messages to queue

for i in {1..100}
do
    TIMESTAMP=$(($(date +%s%N)))
    echo "{\"timestamp\":\"$TIMESTAMP\",\"id\":$i,\"body\":\"my body is $i\"}" \
        | rabbitmqadmin --username=admin --password=admin publish exchange=clickhouse-exchange routing_key=myqueue &
done