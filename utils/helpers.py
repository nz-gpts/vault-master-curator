import os
import json
import datetime

def load_index(index_path):
    with open(index_path, "r") as f:
        return json.load(f)

def save_index(index_path, index_data):
    with open(index_path, "w") as f:
        json.dump(index_data, f, indent=2)

def get_timestamp():
    return datetime.datetime.utcnow().isoformat() + "Z"
