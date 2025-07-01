#!/bin/bash

# Enhanced Batch Curation Script for Vault Master Data
# Implements the Phase 5A workflow with LLM-ready metadata capture

VAULT_PATH="/media/amy/EXTERNAL/Vault_Master_Data"
TOP_DIRS_FILE="$VAULT_PATH/_System/top_dirs.txt"
LOG_FILE="$VAULT_PATH/_System/logs/curation_log_$(date +%Y-%m-%d).md"
INTERACTIVE_MANAGER="$VAULT_PATH/_System/scripts/interactive_file_manager.py"

# Initialize daily log
echo "# Curation Log - $(date +%Y-%m-%d)" > "$LOG_FILE"
echo "## Processing Priority Directories" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Check if top_dirs.txt exists
if [[ ! -f "$TOP_DIRS_FILE" ]]; then
    echo "❌ Error: $TOP_DIRS_FILE not found!"
    echo "Please create this file with your priority directories."
    exit 1
fi

# Function to process a single directory
process_directory() {
    local dir="$1"
    local dir_name=$(basename "$dir")
    
    echo "🎯 Processing: $dir_name"
    echo "### Processing: $dir_name" >> "$LOG_FILE"
    echo "- Started: $(date)" >> "$LOG_FILE"
    
    # Count files to process
    local pdf_count=$(find "$dir" -name "*.pdf" -type f | wc -l)
    local doc_count=$(find "$dir" -name "*.docx" -o -name "*.doc" -type f | wc -l)
    local total_count=$((pdf_count + doc_count))
    
    echo "- PDFs found: $pdf_count" >> "$LOG_FILE"
    echo "- Documents found: $doc_count" >> "$LOG_FILE"
    echo "- Total to process: $total_count" >> "$LOG_FILE"
    
    if [[ $total_count -eq 0 ]]; then
        echo "- ✅ No documents to process" >> "$LOG_FILE"
        echo "" >> "$LOG_FILE"
        return
    fi
    
    # Process each file interactively
    local processed=0
    find "$dir" -type f \( -name "*.pdf" -o -name "*.docx" -o -name "*.doc" \) | while read -r file; do
        echo "📄 Processing: $(basename "$file")"
        
        # Check if already in database (optional enhancement)
        # Call interactive manager
        python3 "$INTERACTIVE_MANAGER" "$file"
        
        processed=$((processed + 1))
        echo "Progress: $processed/$total_count files processed"
    done
    
    echo "- ✅ Completed: $(date)" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
}

# Main processing loop
echo "🚀 Starting Enhanced Batch Curation"
echo "📋 Using directories from: $TOP_DIRS_FILE"
echo "📝 Logging to: $LOG_FILE"
echo ""

# Process each directory from top_dirs.txt
while IFS= read -r dir; do
    # Skip empty lines and comments
    [[ -z "$dir" || "$dir" =~ ^#.*$ ]] && continue
    
    if [[ -d "$dir" ]]; then
        process_directory "$dir"
    else
        echo "⚠️  Directory not found: $dir"
        echo "- ⚠️ Directory not found: $dir" >> "$LOG_FILE"
    fi
    
    # Pause between directories (optional)
    echo "Press Enter to continue to next directory (or Ctrl+C to stop)..."
    read -r
    
done < "$TOP_DIRS_FILE"

echo "✅ Batch curation completed!"
echo "📝 Check log: $LOG_FILE"

# Generate summary
echo "## Summary" >> "$LOG_FILE"
echo "- Session completed: $(date)" >> "$LOG_FILE"
echo "- Next steps: Review processed files and run audit" >> "$LOG_FILE"
