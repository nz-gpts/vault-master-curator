#!/bin/bash
# Simple script to scan a folder and report new files

VAULT_PATH="/media/amy/EXTERNAL/Vault_Master_Data"

echo "Scanning for new files in $VAULT_PATH"
find "$VAULT_PATH" -type f -newermt "7 days ago"
