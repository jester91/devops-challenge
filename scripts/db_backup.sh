#!/bin/bash

# Database backup
pg_dump -U postgres -h postgres://postgres:postgres@db:5432 pollsdb > /backup/db_backup_$(date +%Y%m%d).sql

# Compress backup
gzip /backup/db_backup_$(date +%Y%m%d).sql

# Copy to Azure Blob Storage
az storage blob upload --container-name backups --file /backup/db_backup_$(date +%Y%m%d).sql.gz --name db_backup_$(date +%Y%m%d).sql.gz --account-name devops-challange --account-key devops-challange-key
