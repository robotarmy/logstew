#!/bin/zsh
echo "Starting Monoid Development Replication Set"
function start_mongo_rs() {
  mongod --replSet hvf --port $1 --dbpath ./$2 --quiet &
}
function start_mongo() {
  mongod --port $1 --dbpath ./$2 --quiet &
}
# example
#start_mongo 27017 md1
#start_mongo 27018 md2
#start_mongo 27019 md3

