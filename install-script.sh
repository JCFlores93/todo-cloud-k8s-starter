Install AWS Client:
=========================================================
sudo apt-get install python2.7
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python2.7 get-pip.py
sudo pip install awscli
 
Test it:
aws help
 
Install Kubectl
=========================================================
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
 
Test:
kubectl version --short --client
 
Installing Helm
=========================================================
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
 
Test:
helm version --short --client


------

Commands for creating a Tiller Service Account
==============
==============
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

helm ls

helm repo list

helm ls

helm upgrade "NAME" jeanflores2c-helm-charts/todo --set service.todoProxy.port=80