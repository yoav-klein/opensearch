# Snapshots - S3
---

In this example, we demonstrate how to create and use a snapshot repository of type S3 bucket.

Reminder: In order to take snapshots, you need to create a snapshot _repository_. This may be a filesystem,
a S3 bucket, or few other options.

_Prerequisites_
1. We need to build the opensearch docker image to adjust it to work with S3 bucket.
2. Create a S3 bucket
3. Create an IAM policy to allow an IAM identity (user or role) to write to the S3 bucket.




## NOTES
1. in `opensearch.yml` - the Opensearch configuration file - we add the `path.repo` field.
2. in `docker-compose.yaml` - we add a mount from `./snapshots:/mnt/snapshots`
3. then, to create the repository, we use the `create_repository` function, which creates a new repository object
and maps it to a path.
4. We removed the mounting of the opensearch data to a volume. This is to demonstrate the restoring.

## Usage

1. Run
```
$ docker compose up [-d]
```

2. Create the repository:
```
$ source functions.sh
$ create_repository
```

3. Create some content:
```
$ create_content
```

4. Take a snapshot
```
$ take_snapshot
```

Now, take the cluster down and up again:
```
$ docker compose down
...
$ docker compose up -d
```

Currently, your cluster should not have the `books` index.

6. Restore the books index:
```
$ restore
```
