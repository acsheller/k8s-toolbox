# shellcheck shell=bash

# Enable aliases for non-interactive shells (e.g. `bash -lc`).
shopt -s expand_aliases

alias k='kubectl'

alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kga='kubectl get all'

alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kdd='kubectl describe deploy'

alias kl='kubectl logs'
alias klf='kubectl logs -f'

alias kdel='kubectl delete'

alias kn='kubens'
alias kc='kubectx'
