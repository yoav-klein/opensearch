# With security
---

In this case, we run OpenSearch and OpenSearch Dasboards with security plugin disabled.

With security plugin disabled, you don't need to authenticate to the cluster, and it runs with HTTP
rather than HTTPS

## Usage

Run
```
$ docker compose up [-d]
```

Test connection to OpenSearch:
```
$ curl http://localhost:5601 -u 'admin:admin'
```

Test connection to OpenSearch Dashboards. Browse to `http://<ip>:5601`
