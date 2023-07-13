
create_repo() {

    chmod 777 snapshots
    curl -X POST -H "Content-Type: application/json" http://localhost:9200/_snapshot/my-repository -d \
'{
  "type": "fs",
  "settings": {
    "location": "/mnt/snapshots"
  }
}'

}

remove_repo() {
    curl -X DELETE http://localhost:9200/_snapshot/my-repository
}

take_snapshot() {
    curl -X PUT http://localhost:9200/_snapshot/my-repository/1
}
