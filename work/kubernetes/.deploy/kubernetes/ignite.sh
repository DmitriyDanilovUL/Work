!#/bin/bash
clear
echo " Start Kind Cluster "

kind create cluster --config=kind.yml
echo " Start Nginx Ingress for Kind"
kubectl apply -f deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

echo "Create NameSpace Exercise-02"

kubectl apply -f ns.yml

echo " Start postgreql 14 in Exercise-02"

kubectl apply -f postgresql.yml -n exercise-02

echo " Start migration DB"
kubectl apply -f job.yml -n exercise-02 

echo " Start Flask APP"
kubectl apply -f application.yml -n exercise-02


echo "docker pull "

docker pull dmityd/appflask:0.1