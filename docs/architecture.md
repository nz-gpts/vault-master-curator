# Vault Master Curator - Architecture

## Overview
Vault Master Curator is a toolkit to manage and curate knowledge vaults. It indexes, tags, and validates file archives in a consistent, transparent, open-source way.

## Components

- **metadata/**: holds the current vault index and tag rules
- **data-models/**: defines JSON schema for valid metadata
- **utils/**: reusable Python helpers
- **scripts/**: command-line helpers to automate scanning or ingest
- **tests/**: basic unit tests for curation workflows
- **examples/**: sample data structure to demonstrate functionality

## Workflow

1. **Ingest** new files into Vault_Master_Data
2. **Scan** with `ingest_new_files.sh`
3. **Tag & Index** using `curate.py` or interactive tools
4. **Validate** the metadata against `vault_item_schema.json`
5. **Commit** updates to the vault index
6. **Publish** (optional) cleaned metadata for sharing or AI enrichment

## Future Enhancements

- AI-based auto-tagging
- Language model text extraction
- Image classification pipelines
- Timeline metadata visualization

---

**This file is the backbone of contributor documentation.**
