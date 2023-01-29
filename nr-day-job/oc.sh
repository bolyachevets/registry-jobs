#! /bin/sh
oc login --server=$OC_SERVER --token=$OC_TOKEN
oc -n $OC_NAMESPACE port-forward  $(oc get pods --selector name=$OC_SELECTOR -o name  -n $OC_NAMESPACE) 8006:5432
