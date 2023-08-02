#!/bin/sh

_config() (
printf '%s' "apiVersion: v1
kind: Config
clusters:
  - cluster:
      certificate-authority-data: $_CA
      server: $URL
    name: $NAME
contexts:
  - context:
      cluster: $NAME
      namespace: $NS
      user: $SA
    name: $NAME
current-context: $NAME
preferences: {}
users:
  - name: $SA
    user:
      token: $_TOKEN
"
)

main() (
  NS=${NS:-default}
  SA=${SA:-default}
  NAME=${NAME:-default}
  URL=${URL:-https://localhost:6443}
  _TOKEN=$(kubectl create token -n $NS $SA --duration ${TTL:-24}h)
  _CA=$(kubectl config view --raw --minify --flatten -o jsonpath='{.clusters[].cluster.certificate-authority-data}')
  _config
)

main
