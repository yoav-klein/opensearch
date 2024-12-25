
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

create_content() {
    curl -X POST "http://localhost:9200/_bulk" -H "Content-Type: application/json" --data-binary @data.json
}

remove_repo() {
    curl -X DELETE http://localhost:9200/_snapshot/my-repository
}

take_snapshot() {
    curl -X PUT http://localhost:9200/_snapshot/my-repository/2
}

restore() {
    curl -X POST localhost:9200/_snapshot/my-repository/2/_restore -H "Content-Type: application/json" -d '{"indices": ["books"]}'
}
