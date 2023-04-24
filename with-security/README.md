# With security
---

In this case, we run OpenSearch and OpenSearch Dasboards with security plugin enabled.

## Usage

Run
```
$ docker compose up [-d]
```

Test connection to OpenSearch:
```
$ curl https://localhost:5601 -u 'admin:admin'
```

Test connection to OpenSearch Dashboards. Browse to `http://<ip>:5601`
