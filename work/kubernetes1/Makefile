hosts:
    echo "Add 'flask.local' in file  /etc/hosts "
    sudo echo '127.0.0.1   flask.local' >> /etc/hosts 
cluster:
	echo " Start Kind Cluster "
	kind create cluster --config=kind.yml

nginx:
	echo " Start Nginx Ingress for Kind"
	kubectl apply -f deploy.yaml
	kubectl wait --namespace ingress-nginx \
  	--for=condition=ready pod \
  	--selector=app.kubernetes.io/component=controller \
  	--timeout=90s

install-app:
	echo "Create NameSpace name02"
	kubectl apply -f ns.yml
	echo " Start postgreql 14 in Exercise"
	kubectl apply -f postgresql.yml -n name02
	echo " Start migration DB"
	kubectl apply -f job.yml -n name02 
	echo " Start Flask APP"
	kubectl apply -f application.yml -n name02

clean-app:
	kubectl delete ns name02

clean-cluster:
	kind delete cluster