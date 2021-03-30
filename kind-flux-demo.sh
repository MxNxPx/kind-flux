#!/bin/bash

. ./demo-magic.sh
clear;echo;echo;
PROMPT_TIMEOUT=0
MSG="LET'S GET THIS DEMO STARTED..."
COW="/usr/share/cowsay/cows/default.cow"
pe "echo \$MSG | cowsay -f \$COW"

## create kind cluster
echo;echo
p "[.] kind"
pei "kubectl cluster-info"
echo;echo
pei "docker ps"
echo;echo
pei "time (kind create cluster --config ./kind-config-1m2w-ingress.yaml --image kindest/node:v1.18.2 --name staging --wait 5m && kubectl wait --timeout=5m --for=condition=Ready nodes --all)"
#pei "time (kind create cluster --config ./kind-config-1m2w-ingress.yaml --image kindest/node:v1.18.2 --name production --wait 5m && kubectl wait --timeout=5m --for=condition=Ready nodes --all)"
pei "docker ps -a --format \"table {{.Names}}\\\t{{.Image}}\\\t{{.Status}}\""

## view cluster status
pe "kubectl get nodes -o wide"
pe "kubectl get pods -A"

## bootstrap flux
echo;echo
p "[.] bootstrap flux and git repo"
#pe "kubectl create secret generic flux-git-deploy --from-file=identity=./id_ed25519"
pe "flux bootstrap github --token-auth --context=kind-staging --owner=${GITHUB_USER} --repository=${GITHUB_REPO} --branch=main --personal --path=clusters/staging"
#pe "flux bootstrap github --token-auth --context=kind-production --owner=${GITHUB_USER} --repository=${GITHUB_REPO} --branch=main --personal --path=clusters/staging"

## create entropy
#pe "sudo rngd -r /dev/urandom"
#pe "cat /proc/sys/kernel/random/entropy_avail"

PROMPT_TIMEOUT=0
echo;echo
MSG="THE WORK IS DONE."
COW="./sheep.cow"
pe "echo \$MSG | cowsay -f \$COW"

#pe "kind delete cluster"
