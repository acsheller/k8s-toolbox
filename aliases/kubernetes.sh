# shellcheck shell=bash

# Enable aliases for non-interactive shells (e.g. `bash -lc`).
shopt -s expand_aliases

alias k='toolbox kubectl'
alias kg='toolbox kubectl get'
alias kgp='toolbox kubectl get pods'
alias kgpa='toolbox kubectl get pods -A'
alias kgs='toolbox kubectl get svc'
alias kd='toolbox kubectl describe'
alias kdel='toolbox kubectl delete'
alias kgs='toolbox kubectl get svc'
alias kgd='toolbox kubectl get deploy'
alias kga='toolbox kubectl get all'

alias kdp='toolbox kubectl describe pod'
alias kds='toolbox kubectl describe svc'
alias kdd='toolbox kubectl describe deploy'

alias kl='toolbox kubectl logs'
alias klf='toolbox kubectl logs -f'


alias kn='toolbox kubens'
alias kc='toolbox kubectx'

alias h='toolbox helm'
alias k9='toolbox k9s'
alias st='toolbox stern'
alias kl='toolbox kubectl logs'
alias kf='toolbox kubectl port-forward'
alias ke='toolbox kubectl exec -it'