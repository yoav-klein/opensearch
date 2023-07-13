
setup_iam() {
    # create IAM role
    echo "== create policy"
    aws iam create-policy --policy-name OpensearchSnapshotPolicy --policy-document file://policy.json

    current_user=$(aws sts get-caller-identity --query='Arn' --output text)
    echo "== current user: $current_user"
    sed "s@<user-arn>@$current_user@" trust-policy.json.template > trust-policy.json
    
    echo "== create role"
    aws iam create-role --role-name OpensearchSnapshotRole --assume-role-policy-document file://trust-policy.json
    policy_arn=$(aws iam list-policies --query "Policies[?PolicyName=='OpensearchSnapshotPolicy'].Arn" --output text)

    echo "== attach them"
    aws iam attach-role-policy --role-name OpensearchSnapshotRole --policy-arn $policy_arn
    

    role_arn=$(aws iam list-roles --query='Roles[?RoleName==`OpensearchSnapshotRole`].Arn' --output text)
    aws sts assume-role --role-arn $role_arn

    # replace the values in the Dockerfile
}


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
    curl -X PUT http://localhost:9200/books
    curl -X POST http://localhost:9200/books/_doc -H "Content-Type: application/json" -d '{
    "name": "1984",
    "author": "George Orwell"
    }'
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
