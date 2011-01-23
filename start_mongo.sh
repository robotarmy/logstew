#!/bin/zsh
echo "Starting Monoid Development Replication Set"
function start_mongo() {
  mongod --replSet hvf --port $1 --dbpath ./$2 --quiet &
}
start_mongo 27017 md1
start_mongo 27018 md2
start_mongo 27019 md3

