#!/usr/bin/env bash
echo 'assuming docker service is running... starting minicube'
minikube start

echo 'add the bitnami repo... then add litmuschaos...'
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm/
helm repo list

echo 'create litmus namespace and install chaos engine'
kubectl create ns litmus
helm install chaos litmuschaos/litmus --namespace=litmus --set portal.frontend.service.type=NodePort

echo 'enable frontend ui in the background'
kubectl port-forward svc/chaos-litmus-frontend-service 9091:9091 &
echo 'http://admin:litmus@127.0.0.1:9091'
echo 'username: admin  password: litmus'

echo 'apply chaos'
kubectl apply -f qa-chaos-litmus-chaos-enable.yml -n litmus
kubectl get deployments --show-labels -n litmus

echo 'add api nodejs repo'
# docker image build -f "api/Dockerfile" .
# kubectl apply -f qa-chaos-litmus-chaos-enable.yml

kubectl apply -f pod02.yaml
kubectl get po,svc,deploy