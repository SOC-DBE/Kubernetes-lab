#!/bin/bash
# Script de provisionnement pour le maître K3S

# Installation de K3S sur le maître
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

# Récupération du token et sauvegarde dans un fichier partagé
TOKEN=$(cat /var/lib/rancher/k3s/server/node-token)
echo $TOKEN > /vagrant/token
