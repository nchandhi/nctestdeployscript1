#!/bin/sh

STORAGE_ACCOUNT=$1
CSV_FILE_URL=$2

echo "Logging in with Managed Identity..."
az login --identity

echo "Downloading CSV file..."
wget -O /tmp/data.csv "$CSV_FILE_URL"

echo "Uploading CSV file to Azure Storage..."
az storage blob upload \
  --account-name $STORAGE_ACCOUNT \
  --container-name mycontainer \
  --name data.csv \
  --file /tmp/data.csv \
  --auth-mode login

echo "Upload complete!"
