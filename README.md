# ⚙️ Infrastructure Terraform – Bot d'Arbitrage avec Jenkins + Spring Boot (Staging & Prod)

Ce dépôt configure automatiquement l'infrastructure cloud complète pour ton bot d’arbitrage, déployé sur AWS.

---

## 🌐 Architecture Résumée

- 🔧 **Jenkins** (EC2 dans un **subnet privé**, exposé via `/jenkins` via un **ALB** public en HTTPS)
- 🚀 **Application Spring Boot** déployée sur **ECS Fargate**, avec deux environnements :
  - `staging` accessible via `/staging`
  - `prod` accessible via `/`
- 📦 **Un seul ECR** pour stocker toutes les images Docker
- 🔐 **IAM finement configuré** pour permettre à Jenkins de :
  - Pousser les images Docker sur ECR
  - Déclencher les mises à jour ECS
- 🛡️ **ALB** avec **routage basé sur les chemins** (path-based routing)

---

## 🚀 Déploiement

### 1. Prérequis

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- Un compte AWS avec les permissions suffisantes
- (Optionnel) Un nom de domaine pointant vers l’ALB

### 2. Initialiser Terraform

```bash
terraform init