FROM alpine:3.20

ARG KUBECTL_VERSION=v1.30.3
ARG HELM_VERSION=v3.15.3
ARG K9S_VERSION=v0.32.5
ARG STERN_VERSION=v1.30.0
ARG YQ_VERSION=v4.44.3
ARG KUSTOMIZE_VERSION=v5.4.3
ARG KUBECTX_VERSION=v0.9.5

RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    tar \
    gzip \
    ca-certificates

RUN set -eux; \
    curl -fsSL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"; \
    chmod +x /usr/local/bin/kubectl; \
    curl -fsSL "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" -o /tmp/helm.tgz; \
    tar -xzf /tmp/helm.tgz -C /tmp; \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm; \
    chmod +x /usr/local/bin/helm; \
    curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz" -o /tmp/k9s.tgz; \
    tar -xzf /tmp/k9s.tgz -C /tmp; \
    mv /tmp/k9s /usr/local/bin/k9s; \
    chmod +x /usr/local/bin/k9s; \
    curl -fsSL -o /usr/local/bin/stern "https://github.com/stern/stern/releases/download/${STERN_VERSION}/stern_linux_amd64"; \
    chmod +x /usr/local/bin/stern; \
    curl -fsSL -o /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64"; \
    chmod +x /usr/local/bin/yq; \
    curl -fsSL "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" -o /tmp/kustomize.tgz; \
    tar -xzf /tmp/kustomize.tgz -C /tmp; \
    mv /tmp/kustomize /usr/local/bin/kustomize; \
    chmod +x /usr/local/bin/kustomize; \
    curl -fsSL "https://github.com/ahmetb/kubectx/archive/refs/tags/${KUBECTX_VERSION}.tar.gz" -o /tmp/kubectx.tgz; \
    tar -xzf /tmp/kubectx.tgz -C /tmp; \
    mv "/tmp/kubectx-${KUBECTX_VERSION}/kubectx" /usr/local/bin/kubectx; \
    mv "/tmp/kubectx-${KUBECTX_VERSION}/kubens" /usr/local/bin/kubens; \
    chmod +x /usr/local/bin/kubectx /usr/local/bin/kubens; \
    rm -rf /tmp/*

COPY aliases/kubernetes.sh /etc/profile.d/kubernetes.sh

WORKDIR /work

ENTRYPOINT ["/bin/bash", "-l"]
