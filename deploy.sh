#!/bin/bash

source .env

az group create -l $LOCATION -n $RESOURCE_GROUP

az storage account create -n $STORAGE_ACCOUNT -g $RESOURCE_GROUP -l $LOCATION 

az storage blob service-properties update --account-name $STORAGE_ACCOUNT --static-website --index-document 'index.html' # enable static website and load index.html on root

az storage blob upload-batch -s resume -d '$web' --account-name $STORAGE_ACCOUNT --overwrite

echo "The endpoint for the uploaded resume is:"

az storage account show -n $STORAGE_ACCOUNT -g $RESOURCE_GROUP --query "primaryEndpoints.web" --output tsv
