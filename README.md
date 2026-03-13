# k8s-toolbox

`k8s-toolbox` is a portable, containerized Kubernetes operator toolbox. It packages commonly used Kubernetes CLI tools into one Docker image so you can run commands consistently from any host with Docker installed.

Included tools:

- kubectl
- helm
- k9s
- kubectx
- kubens
- stern
- jq
- yq
- kustomize

## Why containerize Kubernetes tooling?

Running Kubernetes tools in a container has a few practical benefits:

- Keeps tool versions consistent across machines and teammates.
- Avoids installing and maintaining `kubectl`, `helm`, and other binaries directly on your host.
- Makes onboarding easier: pull/build once, then use a single wrapper script.
- Reduces host pollution while still giving full access to your kubeconfig and working directory.

## Build the toolbox image

Build with Docker Compose:

```bash
docker compose -f compose.yml build
```

Or build directly with Docker:

```bash
docker build -t k8s-toolbox:latest .
```

## Use the toolbox wrapper script

The wrapper script is `bin/toolbox` (it is executable). It starts the toolbox container and mounts your Kubernetes and Helm state paths.

Mounted paths:

- `$KUBECONFIG` -> `/kube/config` (read-only)
- `$HOME/.k9s` -> `/root/.k9s`
- `$HOME/.config/helm` -> `/root/.config/helm`
- `$HOME/.cache/helm` -> `/root/.cache/helm`
- `$HOME/.local/share/helm` -> `/root/.local/share/helm`
- current directory -> `/work`

The wrapper also sets:

- `KUBECONFIG=/kube/config` inside the container.

### Run examples

```bash
export KUBECONFIG=.kube/kind-armada.yaml

bin/toolbox kubectl get nodes
bin/toolbox kgp
bin/toolbox helm list
bin/toolbox stern otel
bin/toolbox k9s
```

If you run `bin/toolbox` with no arguments, it opens an interactive shell in the container. The shell loads aliases from `aliases/kubernetes.sh`, including examples like `k`, `kgp`, `kn`, and `kc`.

## Optional host convenience alias

If you want to run `toolbox ...` directly, add an alias in your shell profile:

```bash
alias toolbox="$PWD/bin/toolbox"
```

Then you can run commands exactly like:

```bash
toolbox kubectl get pods
toolbox helm list
toolbox stern otel
toolbox k9s
```

This approach keeps Kubernetes tooling versions consistent and avoids installing Kubernetes CLI tools directly on the host.
