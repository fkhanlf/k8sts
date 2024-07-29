#!/bin/bash
 kubectl apply -f "https://raw.githubusercontent.com/fazlurkh/pods/main/ts.yaml" >> /dev/null
 kubectl taint node `kubectl get nodes --no-headers | tail -2 | awk '{print $1}'` cka=test:NoSchedule --overwrite >> /dev/null
 kubectl run error --image nginx  >> /dev/null
mkdir -p ~/backup
cp -p ~/.kube/config ~/backup/  >> /dev/null
sed -e 's/6443/9663/g' -i ~/.kube/config
sudo cp -p /etc/kubernetes/manifests/kube-apiserver.yaml ~/backup/ >> /dev/null
sudo sed -e 's/RBAC/RBAC,RRBBAACC/g' -i /etc/kubernetes/manifests/kube-apiserver.yaml
sudo systemctl disable --now kubelet &> /dev/null
sudo sleep 10
sudo echo "Something went wrong, Identify and fix the problem."
