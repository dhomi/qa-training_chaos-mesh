# Chaos Testing with Mesh and Cubernetes

## installation
install docker
install kubernetes
install helm
install chaos mesh

## run in mac os
minikube start

### to enable the dashboard
helm upgrade chaos-mesh chaos-mesh/chaos-mesh --namespace=chaos-testing --version v0.5.4 --set dashboard.securityMode=false
kubectl port-forward -n chaos-mesh svc/chaos-dashboard 2333:2333

dashboard is dus hier te zien: http://127.0.0.1:2333/


## create a helm pod with ngnix
(read: https://scribe.rip/@muppedaanvesh/deploying-nginx-on-kubernetes-a-quick-guide-04d533414967?)

met de hand:
kubectl apply -f nginx-pod.yaml -n chaos-mesh
kubectl get pods -n chaos-mesh
kubectl apply -f nginx-service.yaml -n chaos-mesh
kubectl get svc -n chaos-mesh
minikube service nginx-svc --url http://127.0.0.1:80 -n chaos-mesh

nu een pod-kill experiment uitveren
TODO: time in sec. in de pod-kill experiment invoeren

kubectl get svc -n chaos-mesh
kubectl get pods -n chaos-mesh 
