#!/usr/bin/env bash
set -euo pipefail

# 1) kind
kind create cluster --config ./cluster.yml || true

# 2) taints для mysql-нод
kubectl label nodes kind-worker app=mysql --overwrite || true
kubectl label nodes kind-worker2 app=mysql --overwrite || true
kubectl taint nodes -l app=mysql app=mysql:NoSchedule --overwrite || true

# 3) helm dependencies + install/upgrade
helm dependency update helm-chart/todoapp
helm upgrade --install todo helm-chart/todoapp

# 4) зібрати стейт у output.log
kubectl get all,cm,secret,ing -A | tee output.log
