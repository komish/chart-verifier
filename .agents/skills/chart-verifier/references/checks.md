# Checks

`chart-verifier verify` runs a set of named checks against a chart.
Not all checks are local: some reach out to the network, a container registry, or a Kubernetes/OpenShift cluster.
For execution options and operational effects, see [flags-and-side-effects.md](flags-and-side-effects.md).

## Local static checks (no cluster needed)

These only inspect the chart's files (plus `helm lint` for `helm-lint`):

- `is-helm-v3` - the URI points at a Helm v3 chart.
- `has-readme` - the chart contains `README.md`.
- `has-notes` - the chart contains `templates/NOTES.txt`.
- `contains-test` - the chart contains at least one test file (`templates/tests/`).
- `contains-values` - the chart contains `values.yaml`.
- `contains-values-schema` - the chart contains `values.schema.json`.
- `has-kubeversion` - `Chart.yaml` includes a valid `kubeVersion`.
- `not-contains-crds` - no custom resource definitions in the chart.
- `not-contain-csi-objects` - no CSI objects in the chart.
- `required-annotations-present` - required OpenShift annotations are present (e.g. `charts.openshift.io/name`).
- `helm-lint` - runs `helm lint` against the chart (needs the `helm` binary available to chart-verifier).
- `signature-is-valid` - verifies a signed chart against a user-supplied PGP public key.

## Checks needing network or registry access

- `images-are-certified` - requires access to remote registries and Red Hat certification APIs to confirm referenced images are certified.

## Checks needing a live cluster

- `chart-testing` - installs the chart and runs its tests on a Kubernetes / OpenShift cluster. Requires cluster access and credentials through the configured kubeconfig context.
