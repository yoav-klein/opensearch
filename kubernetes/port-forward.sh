#!/bin/bash

kubectl port-forward --address=0.0.0.0 -n storage svc/opensearch-dashboards 8080:5601
