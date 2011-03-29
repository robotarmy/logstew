start_mongo () {
	mongod --port $1 --dbpath $2 --rest
}
logstew_mongo () {
	start_mongo 27017 $HOME/Hack/logstew/mongo
}
