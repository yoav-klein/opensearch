
# OpenSearch in Kubernetes
---

We have 2 deployments - one with volume, and one without. The volume is used to persist
the data. When you run on EKS, run without.

This configuration creates a OpenSearch Deployment and Service, and
OpenSearch Dashboards Deployment and Service


## Usage
---

Run
```
$ kubectl apply -f opensearch.yaml
# or kubectl apply -f opensearch-no-vol.yaml
$ kubectl apply -f opensearch-dashboards.yaml
```

Then, run 
```
$ ./port-forward.sh
```

This will port-forward the `opensearch-dashboards` service with local port 8080 

## NOTES

For some reason, when running `port-forward.sh` from A Cloud Guru, I couldn't
connect from outside the network.

The workaround for this is to run SSH port forwarding from your Windows machine to 
the Cloud Guru machine.
So run the `port-forward.sh`, and the run 
```
ssh -L <local_port>:localhost:8080 <this_machine's_ip>
```
