Vault Master Curation System
Version 2.0

A powerful, database-integrated file curation tool for managing and tagging large personal or research archives.

✨ Features
Batch directory scanning

Smart metadata tagging (PDF, DOCX, text files)

SQLite-backed database for metadata storage

Interactive command-line interface

Extendable design for future AI or automation features

🛠️ Requirements
Python 3.10+

Bash (standard on Linux)

SQLite3

Python packages:

PyPDF2

python-docx

🚀 Installation
From your scripts folder:

bash
Copy
Edit
pip install -r requirements.txt
▶️ Usage
Navigate to the Vault root:

bash
Copy
Edit
cd /media/amy/EXTERNAL/Vault_Master_Data
Launch the batch curator:

bash
Copy
Edit
./_System/scripts/batch_curator.sh
This will scan your priority directories and send files one by one to the interactive manager.

Use the interactive manager directly (optional):

bash
Copy
Edit
python3 _System/scripts/interactive_file_manager.py
The interactive prompts will guide you to:

preview file content

enter or edit metadata

store results in the database

✅ Tested Environment
Ubuntu 22.04 LTS

Python 3.10

Bash: /usr/bin/bash

SQLite3: /usr/bin/sqlite3

📌 Roadmap
Add web UI (optional)

Add fully automated batch mode

Enhance error logging
