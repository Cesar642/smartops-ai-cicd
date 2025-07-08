#!/bin/bash

set -e

echo "🚀 Applying SmartOps deployment to Minikube..."

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "⏳ Waiting for pod to be ready..."
kubectl rollout status deployment/smartops-deployment

echo "✅ Deployment complete!"

NODE_PORT=$(kubectl get svc smartops-service -o=jsonpath='{.spec.ports[0].nodePort}')
MINIKUBE_IP=$(minikube ip)
echo "🌐 Access your app at: http://${MINIKUBE_IP}:${NODE_PORT}/api/greet"

