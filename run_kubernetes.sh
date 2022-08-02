#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=iykeprince/project-ml-microservice-kubernetes:latest

# # Assuming the Kubernetes cluster is ready
# kubectl get nodes
# # Deploy an App from the Dockerhub to the Kubernetes Cluster
# kubectl create deploy projmlmicroservicekubernetes --image=$dockerpath
# # See the status
# kubectl get deploy,rs,svc,pods

# Step 2
# Run the Docker Hub container with kubernetes
# Assuming the Kubernetes cluster is ready
kubectl get nodes
# Deploy an App from the Dockerhub to the Kubernetes Cluster
kubectl create deploy mlab --image=$dockerpath
# See the status
kubectl get deploy,rs,svc,pods

kubectl run mlab \
    --image=$dockerpath\
    --port=80 --labels app=projmlmicroservicekubernetes

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward mlapp 8000:80

