
# echo "Add 'flask.local' in file  /etc/hosts "
sudo echo '127.0.0.1   flask.local >> /etc/hosts'  
# Kind create cluster + Nginx ingress
kind create cluster --config=kind.yml
# NameSpace
kubectl apply -f ns.yml
# Start Postgresql 14 
kubectl apply -f postgresql.yml -n name02
# Start migration DataBase 
kubectl apply -f job.yml -n name02
# Start Flask App
kubectl apply -f pplication.yml -n name02
