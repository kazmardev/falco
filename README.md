# falco 

1. Add parameters from file "kube-apiserver-parameters.txt" to all masters manifests.
2. kubectl create ns audit-system
3. kubectl create -f falco_configmap.yaml -n audit-system
4. kubectl create -f falco.yaml -n audit-system
5. bash install_auditsink.sh

To test use "kubectl create -f falco-event-generator.yaml"