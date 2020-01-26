#!/bin/bash

FALCO_SERVICE_IP=$(kubectl get service falco -n audit-system -o=jsonpath={.spec.clusterIP})

cat << EOF | kubectl apply -f -
---
# Source: falco/templates/auditsink.yaml
apiVersion: auditregistration.k8s.io/v1alpha1
kind: AuditSink
metadata:
  name: falco
spec:
  policy:
    level: RequestResponse
    stages:
      - ResponseComplete
      - ResponseStarted
  webhook:
    throttle:
      qps: 10
      burst: 15
    clientConfig:
      url: "http://$FALCO_SERVICE_IP:8765/k8s_audit"  
EOF