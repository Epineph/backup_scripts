#!/bin/bash

generate_tree_overview() {
    local target_dir="$1"
    local output_file="$2"

    if [[ -z "$target_dir" || -z "$output_file" ]]; then
        echo "Usage: $(basename "$0") target_directory output_file"
        exit 1
    fi

    tree -A "$target_dir" > "$output_file.txt"
    echo "Tree overview saved to $output_file.txt"

    if command -v pandoc &> /dev/null; then
        pandoc "$output_file.txt" -o "$output_file.pdf"
        echo "PDF report saved to $output_file.pdf"
    else
        echo "Pandoc not installed, skipping PDF generation"
    fi
}

generate_tree_overview "$1" "$2"

