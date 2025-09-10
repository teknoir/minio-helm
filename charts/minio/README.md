# MinIO Helm Chart

This chart deploys MinIO to a Kubernetes cluster.

> The implementation of the Helm chart is right now the bare minimum to get it to work.

## Usage in Teknoir platform
Use the HelmChart to deploy the MinIO to a Device.

```yaml
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: minio
  namespace: default
spec:
  repo: https://teknoir.github.io/minio-helm
  chart: minio
  targetNamespace: default
  valuesContent: |-
    # Example for minimal configuration
    
```

## Adding the repository

```bash
helm repo add teknoir-minio https://teknoir.github.io/minio-helm/
```

## Installing the chart

```bash
helm install minio teknoir-minio/minio -f values.yaml
```