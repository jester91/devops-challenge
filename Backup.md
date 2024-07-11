### Backup for Database
db_backup.sh script should be placed within the db deployment, this backup should be run daily as a cronjob and it should upload the data to an Azure blob storage. 
Script path:  ``` \scripts\db_backup.sh ```
Crontab config: ``` 0 23 * * * scripts/backup_script.sh ```

### Backup for AKS
Because we're using Azure AKS we have the Azure Backup tool that is able to backup our cluster. In this tool, we're able to create backup policy based on our preference like when the backup should be created, how frequently, configure backups and rollback earlier states. 
Azure backup can be setup with UI or with Azure CLI

RESOURCE_GROUP="devops-challenge-rg"
CLUSTER_NAME="devops-challenge-aks"
VAULT_NAME="devops-challenge-vault"
POLICY_NAME="devops-challenge-backup-policy"

# Enable backup for AKS cluster
```
az backup protection enable-for-aks \
  --resource-group $RESOURCE_GROUP \
  --vault-name $VAULT_NAME \
  --aks-cluster $CLUSTER_NAME \
  --policy-name $POLICY_NAME
```

# Trigger initial backup 
```
az backup job start \
  --resource-group $RESOURCE_GROUP \
  --vault-name $VAULT_NAME \
  --backup-management-type AzureKubernetesService \
  --workload-type AzureKubernetesCluster \
  --container-name $CLUSTER_NAME 
```
# Restore:

# Initiate restore process
```
az backup restore start \
  --resource-group $RESOURCE_GROUP \
  --vault-name $VAULT_NAME \
  --restore-point $RESTORE_POINT \
  --target-container $CLUSTER_NAME \
  --restore-mode Overwrite
```
