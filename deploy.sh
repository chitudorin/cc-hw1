#!/bin/bash

source .env

az group create -l $LOCATION -n $RESOURCE_GROUP