# create_kubeconfig

create_kubeconfig is a small script to create a kubeconfig file for a specified service account.

Must be invoked on a host which already have access to the server in question.

```sh
URL=https://hostname:6443 NAME=mykube SA=mysa NS=kube-system TTL=168 sh -c "$(curl -fsSL https://raw.githubusercontent.com/dxlr8r/create_kubeconfig/main/create_kubeconfig.sh)" > ~/.kube/mykubeconfig
```

As seen from the example above, you can/need to define multiple variables to get a valid kubeconfig. The value of these will of course vary depending on server, service account in question etc.

Description and defaults of configuration variables:

- URL: the url the user of the kubeconfig will use to connect to the Kubernetes: https://localhost:6443
- NAME: name of the cluster and context: default
- SA: ServiceAccount you want to connect as: default
- NS: namespace where the SA (Service Account) is located: default
- TTL: requested hours token is valid: 24
