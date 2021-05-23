# falco 

1. Create file apiserver-audit-policy.yaml in path /etc/kubernetes/audit-policy/ on all masters.
2. Create file audit-webhook.yml in path /etc/kubernetes/audit-policy/ on all masters.
3. Add parameters from file "kube-apiserver-parameters.txt" to all masters manifests.
4. kubectl create ns audit-system
5. kubectl create -f falco-configmap.yaml
6. kubectl create -f falco.yaml
