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

## License considerations
```text
Short answer: if your pipeline just talks to a MinIO server over its S3-compatible HTTP API (or via MinIO’s client SDKs) to store images, the AGPLv3 does not force you to open-source your pipeline. The AGPL obligations primarily attach to the MinIO server itself (and to any code you merge into or link with AGPL code), not to software that merely uses it over the network. MinIO’s own SDKs remain Apache-2.0 licensed, so using them doesn’t impose copyleft on your app.  ￼ ￼ ￼

When the AGPL does affect you
	•	You modify MinIO and let others use it over a network. AGPL §13 requires you to offer the complete corresponding source of your modified MinIO to those network users.  ￼
	•	You distribute MinIO (e.g., ship a Docker image or appliance). You must provide the corresponding source for the exact MinIO version you convey and preserve license notices. (This is standard GPLv3/AGPLv3 distribution duty.)  ￼
	•	MinIO’s own guidance is stricter. Their compliance page says that if you “distribute, host or create derivative works… over the network,” you must distribute source “whether or not you modified MinIO.” That goes beyond many common readings of §13, so treat it as their position and assess your risk (or use their commercial license).  ￼

Typical scenarios for your pipeline
	•	Internal use; unmodified MinIO; your code calls the API/SDK. No copyleft on your pipeline. Keep MinIO unmodified and separate; include notices/source only if you actually redistribute MinIO bits.  ￼
	•	SaaS product; unmodified MinIO behind the scenes. Common interpretation: no obligation to disclose your app’s source, since §13 is triggered by modifying the AGPL program. MinIO’s site suggests a broader duty—if you want zero ambiguity, consider their commercial license or provide a prominent link to the exact MinIO source you run.  ￼ ￼
	•	You fork/patch MinIO. You must offer the source of your modified MinIO to all remote users who interact with it. This does not automatically “infect” your separate services that only talk to MinIO over HTTP.  ￼

Practical compliance tips
	1.	Don’t embed or link AGPL server code into your app; keep MinIO as an external service you call over HTTP. (Using the Apache-2.0 MinIO SDKs is fine.)  ￼ ￼
	2.	If you distribute MinIO (binary or container), ship the license and an offer/link to the exact source you conveyed; record the commit/tag you run.  ￼
	3.	If you modify MinIO, add a prominent “get the source” link in the UI or another customary place so remote users can download your modified source, per §13.  ￼
	4.	If legal risk tolerance is low—or you want to avoid MinIO’s broader compliance stance—buy the commercial license from MinIO.  ￼

Not legal advice; for a production SaaS, have counsel review your exact deployment, whether you “convey” MinIO (e.g., via customer installs), and whether you need to mirror source for the precise build you run. For grounding: MinIO server is AGPLv3 while the official client SDKs remain Apache-2.0, and AGPL §13’s network clause is triggered by modifications to the AGPL program.
```