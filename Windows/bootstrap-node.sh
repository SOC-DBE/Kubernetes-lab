#!/bin/bash
# Script de provisionnement pour un nœud K3S

# Adresse IP du maître
MASTER_IP="192.168.56.10"

# Attente de l'accès au token
while [ ! -f /vagrant/token ]; do
  sleep 2
done

# Lecture du token pour se connecter au maître
TOKEN=$(cat /vagrant/token)

# Installation de K3S en tant qu'agent et connexion au maître
curl -sfL https://get.k3s.io | K3S_TOKEN=$TOKEN K3S_URL=https://${MASTER_IP}:6443 sh -
