# Flags and side effects

Determine which [checks](checks.md) the user wants before running, and confirm side effects with them.

## Cluster access and resources

- chart-verifier/Helm pick up cluster access from the ambient kubeconfig or the `--kubeconfig`, `--kube-context`, `--kube-token`, and related flags.
- Do not enable cluster-based checks unless the user explicitly agrees to use a live cluster. Use `--disable chart-testing` for verification without a cluster.
- `chart-testing` creates and normally deletes resources in the cluster. `--skip-cleanup` keeps those resources; use it only when requested. Warn that leftover resources may remain if the run is interrupted.

## Signed charts

- `--pgp-public-key` supplies the public key file for `signature-is-valid`. The key file is user-supplied; do not generate or transmit key material.

## Network and file side effects

- `images-are-certified` makes outbound requests to registries and Red Hat certification APIs; confirm the user is fine with that. Disable it with `--disable images-are-certified` if those requests are not wanted.
- Remote chart URLs are downloaded into the Helm content cache (`~/.cache/helm` by default).
- `--write-to-file` writes `chartverifier/report.yaml` (plus `report-info.*` for `report`) relative to the working directory.
- An error log is written to `chartverifier/verifier-<timestamp>.log` by default; suppress with `--suppress-error-log` if the user prefers no file writes.
