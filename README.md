# kind-flux

structure of this git repo involves a "_shared_" cluster section where base cluster components are defined

then there is a section for each cluster definition that references the "_shared_" component or overrides with specific details

```
├── clusters
│   ├── _shared_
│   │   ├── flux-alerts-base
│   │   ├── gatekeeper-policy-manager-base
│   │   ├── kubed-base
│   │   ├── kube-prometheus-stack-base
│   │   ├── kured-base
│   │   ├── metrics-server-base
│   │   ├── monitoring-base
│   │   ├── namespaces-base
│   │   ├── nginx-base
│   │   ├── node-problem-detector-base
│   │   ├── opa-gatekeeper-base
│   │   ├── policy-base
│   │   ├── portainer-base
│   │   ├── redis-base
│   │   ├── sealed-secrets-base
│   │   ├── sources-base
│   │   ├── stakater-reloader-base
│   │   └── wave-k8s-base
│   ├── production
│   └── staging
```
