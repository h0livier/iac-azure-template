# iac-azure-template

Template Terraform pour créer un Resource Group Azure avec une convention de nommage centralisee.

## Objectif

Ce projet fournit une base simple pour demarrer une infrastructure Azure avec Terraform:

- provider AzureRM configure
- backend d'etat distant Azure Storage configure
- generation du nom du Resource Group via un module externe de naming
- creation d'un Resource Group dans Azure

## Structure du projet

- `providers.tf`: version Terraform, providers requis et backend `azurerm`
- `main.tf`: module de naming et resource `azurerm_resource_group`

## Prerequis

- Terraform >= 1.14.1
- Un abonnement Azure
- Azure CLI installee
- Droits suffisants sur:
	- le Resource Group du backend
	- le compte de stockage du backend
	- la souscription cible pour creer le Resource Group
- Ajouter le repo github à la liste des repo authorisés sur l'Application Azure pour le déploiement


## Authentification Azure

Connectez-vous avant de lancer Terraform:

```bash
az login
az account set --subscription "<SUBSCRIPTION_ID_OU_NOM>"
```

## Backend Terraform

Le backend est configure dans `providers.tf`:

- resource_group_name: `ohaymngmtproject`
- storage_account_name: `ohaymngmtstorage`
- container_name: `tfstate`
- key: `iac-azure-template.tfstate`

Adaptez ces valeurs a votre environnement avant le premier `terraform init` si necessaire.

## Ce que deploie ce template

Dans `main.tf`:

1. Le module externe `iac-naming-helper` construit le nom du Resource Group.
2. Un Resource Group Azure est cree:
	 - nom: issu du module de naming
	 - location: `West Europe`

Valeurs actuellement passees au module de naming:

- project: `test`
- type: `rg`
- environment: `d`

## Utilisation

Depuis la racine du projet:

```bash
terraform fmt
terraform init
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```

## Personnalisation rapide

Dans `main.tf`, vous pouvez modifier:

- `location` pour changer la region Azure
- `data.project` pour l'identifiant projet
- `environment` pour l'environnement (ex: d, t, p)

Dans `providers.tf`, vous pouvez modifier:

- la version minimale de Terraform
- la version du provider `azurerm`
- les parametres du backend

## Destruction

Pour supprimer les ressources:

```bash
terraform destroy
```

## Bonnes pratiques conseillees

- Ne pas versionner de secrets.