#!/bin/bash

index_backups() {
    local backup_root="$HOME/.backup_scripts"
    local index_file="$backup_root/index.txt"

    echo "Backup Index as of $(date)" > "$index_file"
    echo "============================" >> "$index_file"
    echo "" >> "$index_file"

    find "$backup_root" -type f | sort | while read -r file; do
        echo "$file" >> "$index_file"
    done

    echo "Index created at $index_file"
}

index_backups

