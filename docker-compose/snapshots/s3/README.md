# Snapshots - S3
---

In this example, we demonstrate how to create and use a snapshot repository of type S3 bucket.

Reminder: In order to take snapshots, you need to create a snapshot _repository_. This may be a filesystem,
a S3 bucket, or few other options.

_Prerequisites_
1. We need to build the opensearch docker image to adjust it to work with S3 bucket.
2. Create a S3 bucket


## Setup

### Create a bucket
Create a S3 bucket.

### Dockerfile
We need to set the AWS credentials in the Dockerfile in `opensearch-docker`. Make
sure that the IAM user to whom these credentials belong to has access to the bucket.
For simplicity, just use the same user you used to create the bucket.


## NOTES
1. We removed the mounting of the opensearch data to a volume. This is to demonstrate the restoring.
2. Run the docker compose up with the --build flag.

## Usage

1. Run
```
$ docker compose up -d --build
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
