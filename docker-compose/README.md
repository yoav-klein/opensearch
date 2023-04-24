# OpenSearch
---

A Docker compose configuration to run OpenSearch and OpenSearch Dashboards.


## Troubleshooting
---

When trying to run on a small machine, Opensearch conatainer just stops. Run this on a stronger machine (at least 4GB I assume).

Also, run this before:
```
$ sudo sysctl -w vm.max_map_count=262144
```
