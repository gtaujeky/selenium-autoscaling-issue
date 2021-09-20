#!/bin/bash

while true; do
    date
    RESULT=$(curl -X POST -H "Content-Type: application/json" --data '{"query": "{ nodesInfo { nodes { status } } }"}' -s http://localhost:4444/graphql)
    TOTAL=$(echo "$RESULT" | grep -o 'status' | wc -l)
    UP=$(echo "$RESULT" | grep -o 'UP' | wc -l)
    DOWN=$(echo "$RESULT" | grep -o 'DOWN' | wc -l)
    echo "TOTAL = ${TOTAL}"
    echo "UP - $UP"
    echo "DOWN - $DOWN"
    sleep 5
done