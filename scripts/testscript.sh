#!/bin/sh

# Install necessary packages
apt-get update && apt-get install -y curl

# Download files from GitHub
curl -o /test_script.sh https://raw.githubusercontent.com/nchandhi/nctestdeployscript1/main/scripts/test_script.sh

# Download the sample CSV file
curl -o /test_data.csv https://raw.githubusercontent.com/nchandhi/nctestdeployscript1/main/data/test_data.csv

# Upload the sample CSV file to Azure Storage
az storage blob upload --account-name $STORAGE_ACCOUNT_NAME --container-name $CONTAINER_NAME --name test_data.csv --file /test_data.csv --auth-mode login