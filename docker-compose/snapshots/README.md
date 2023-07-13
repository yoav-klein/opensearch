# Snapshots - filesystem
---

In this example, we demonstrate how to create and use a snapshot repository of type filesystem.

Reminder: In order to take snapshots, you need to create a snapshot _repository_. This may be a filesystem,
a S3 bucket, or few other options.

We use the filesystem type repository which is backed by the `snapshots` directory.

## NOTES
1. in `opensearch.yml` - the Opensearch configuration file - we add the `path.repo` field.
2. in `docker-compose.yaml` - we add a mount from `./snapshots:/mnt/snapshots`
3. then, to create the repository, we use the `create_repository` function, which creates a new repository object
and maps it to a path.


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

3. Take a snapshot
```
$ take_snapshot
```

